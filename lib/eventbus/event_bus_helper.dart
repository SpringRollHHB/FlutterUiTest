

import '../log_tools.dart';
import 'event_bus_observer.dart';

class EventBusHelper {
  EventBusHelper._();

  static EventBusHelper? _instance;

  factory EventBusHelper() {
    _instance ??= EventBusHelper._();
    return _instance!;
  }

  static EventBusHelper getInstance() {
    _instance ??= EventBusHelper._();
    return _instance!;
  }

  static final Map<int, Set<EventBusObserver>> _eventListenersMap = {};

  void addObserver(int type, EventBusObserver observer) {
    Set<EventBusObserver>? observers = _eventListenersMap[type];
    if (observers == null) {
      observers = <EventBusObserver>{};
      _eventListenersMap[type] = observers;
    }
    observers.add(observer);
  }

  void removeObserver(int type, EventBusObserver observer) {
    Set<EventBusObserver>? observers = _eventListenersMap[type];
    if (observers != null && observers.contains(observer)) {
      observers.remove(observer);
      if (observers.isEmpty) {
        _eventListenersMap.remove(type);
      }
    }
  }

  void sendEventMessage(int type, String from, dynamic event) {
    LogTools.logI("--sendEventMessage----type:$type,from:$from,event:$event");
    Set<EventBusObserver>? observers = _eventListenersMap[type];
    if (observers != null && observers.isNotEmpty) {
      for (var element in observers) {
        element.receiveMessageEvent(type, from, event);
      }
    }
  }
}
