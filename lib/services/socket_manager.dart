import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';


// class SocketApi {
//   // Singleton pattern for SocketApi
//   factory SocketApi() {
//     return _socketApi;
//   }
//
//   SocketApi._internal();
//
//   static final SocketApi _socketApi = SocketApi._internal();
//
//
//   static IO.Socket? socket;
//
//   // Notification stream for emitting messages
//   static final StreamController<String> _notificationStreamController = StreamController<String>.broadcast();
//   static Stream<String> get notificationStream => _notificationStreamController.stream;
//
//   // Initialize socket connection with the provided URL
//   static void init(String socketUrl) {
//     if (socket == null) {
//       socket = IO.io(
//         socketUrl,
//         IO.OptionBuilder().setTransports(['websocket']).build(),
//       );
//       _setupSocketListeners();
//     }
//   }
//
//   // Setup event listeners for socket events
//   static void _setupSocketListeners() {
//     socket?.onConnect((_) => _onConnect());
//     socket?.onDisconnect((_) => _onDisconnect());
//     socket?.onError((error) => _onError(error));
//     socket?.onReconnect((attempt) => _onReconnect(attempt));
//     socket?.onReconnectError((error) => _onReconnectError(error));
//     socket?.onReconnectFailed((_) => _onReconnectFailed());
//   }
//
//   // Event handler when socket is connected
//   static void _onConnect() {
//     debugPrint('=============> Socket connected');
//   }
//
//   // Event handler when socket is disconnected
//   static void _onDisconnect() {
//     debugPrint('=============> Socket disconnected');
//   }
//
//   // Event handler when there is an error
//   static void _onError(dynamic error) {
//     debugPrint('=============> Socket error: $error');
//   }
//
//   // Event handler for socket reconnection attempt
//   static void _onReconnect(int attempt) {
//     debugPrint('=============> Socket reconnected: Attempt $attempt');
//   }
//
//   // Event handler when reconnect fails
//   static void _onReconnectError(dynamic error) {
//     debugPrint('=============> Socket reconnect error: $error');
//   }
//
//   // Event handler when reconnection fails
//   static void _onReconnectFailed() {
//     debugPrint('=============> Socket reconnect failed');
//   }
//
//   // Emit event to server with optional body
//   static void emit(String event, dynamic body) {
//     if (_isSocketConnected() && body != null) {
//       socket?.emit(event, body);
//       debugPrint('===========> Emit $body');
//     } else {
//       debugPrint('===========> Socket not connected or invalid body');
//     }
//   }
//
//   // Emit event with acknowledgment and handle response
//   static Future<dynamic> emitWithAck(String event, dynamic body) async {
//     Completer<dynamic> completer = Completer<dynamic>();
//
//     if (_isSocketConnected()) {
//       socket?.emitWithAck(event, body, ack: (data) {
//         debugPrint('===========> Emit With Ack: $data');
//         completer.complete(data ?? 1);  // Default response 1 if null
//       });
//     } else {
//       debugPrint('===========> Socket not connected');
//       completer.completeError('Socket not connected');
//     }
//
//     return completer.future;
//   }
//
//   // Check if socket is connected
//   static bool _isSocketConnected() {
//     return socket != null && socket!.connected;
//   }
//
//   // Clean up socket resources
//   static void dispose() {
//     if (_isSocketConnected()) {
//       socket?.disconnect();
//       debugPrint('===========> Socket disconnected');
//     }
//     _notificationStreamController.close();
//   }
// }



// socket_api.dart


// class SocketApi {
//   factory SocketApi() => _instance;
//   SocketApi._internal();
//   static final SocketApi _instance = SocketApi._internal();
//
//   WebSocketChannel? _channel;
//   StreamSubscription? _subscription;
//   bool _isConnected = false;
//
//   final StreamController<String> _messageController = StreamController<String>.broadcast();
//   Stream<String> get messages => _messageController.stream;
//
//   void connect(String url) {
//     if (_isConnected) return;
//
//     try {
//       _channel = WebSocketChannel.connect(Uri.parse(url));
//       _subscription = _channel!.stream.listen(
//             (message) {
//           debugPrint(' Received: $message');
//           _messageController.add(message);
//         },
//         onDone: () => _cleanup(),
//         onError: (error) {
//           debugPrint(' Socket error: $error');
//           _cleanup();
//         },
//         cancelOnError: true,
//       );
//       _isConnected = true;
//       debugPrint(' Connected to WebSocket');
//     } catch (e) {
//       debugPrint(' Connection Failed: $e');
//     }
//   }
//
//   void send(dynamic data) {
//     if (!_isConnected || _channel == null) return;
//     final message = data is String ? data : jsonEncode(data);
//     _channel!.sink.add(message);
//     debugPrint(' Sent: $message');
//   }
//
//   void _cleanup() {
//     _subscription?.cancel();
//     _channel = null;
//     _isConnected = false;
//   }
//
//   void dispose() {
//     _channel?.sink.close();
//     _cleanup();
//     _messageController.close();
//   }
// }



import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


// class SocketApi {
//   static WebSocketChannel? _channel;
//   static bool _connected = false;
//
//   static final StreamController<String> _messageController =
//   StreamController<String>.broadcast();
//
//   static Stream<String> get messageStream => _messageController.stream;
//
//   static void init(int roomId) {
//     if (_connected) return;
//
//     final uri = Uri.parse("ws://192.168.10.18:8004/ws/chat/$roomId/");
//     try {
//       _channel = WebSocketChannel.connect(uri);
//       _connected = true;
//
//       _channel!.stream.listen(
//             (data) {
//           debugPrint('Socket Received: \$data');
//           _messageController.add(data);
//         },
//         onError: (error) {
//           debugPrint('Socket error: \$error');
//           _connected = false;
//         },
//         onDone: () {
//           debugPrint('Socket closed');
//           _connected = false;
//         },
//       );
//     } catch (e) {
//       debugPrint('Failed to connect to socket: \$e');
//     }
//   }
//
//   static void emit(Map<String, dynamic> message) {
//     if (_connected && _channel != null) {
//       final encoded = jsonEncode(message);
//       _channel!.sink.add(encoded);
//     }
//   }
//
//   static void disconnect() {
//     if (_connected && _channel != null) {
//       _channel!.sink.close();
//       _connected = false;
//     }
//   }
// }


class SocketApi {
  static WebSocketChannel? _channel;
  static bool _connected = false;

  static final StreamController<String> _messageController =
  StreamController<String>.broadcast();

  static Stream<String> get messageStream => _messageController.stream;

  static void init(int roomId) {
    if (_connected) return;




    final uri = Uri.parse("ws://10.10.12.49:8002/ws/chat/$roomId/");
    try {
      _channel = WebSocketChannel.connect(uri);
      _connected = true;

      _channel!.stream.listen(
            (data) {
          debugPrint('Socket Received: \$data');
          _messageController.add(data);
        },
        onError: (error) {
          debugPrint('Socket error: \$error');
          _connected = false;
        },
        onDone: () {
          debugPrint('Socket closed');
          _connected = false;
        },
      );
    } catch (e) {
      debugPrint('Failed to connect to socket: \$e');
    }
  }

  static void emit(Map<String, dynamic> message) {
    if (_connected && _channel != null) {
      final encoded = jsonEncode(message);
      _channel!.sink.add(encoded);
    }
  }

  static void disconnect() {
    if (_connected && _channel != null) {
      _channel!.sink.close();
      _connected = false;
    }
  }
}


