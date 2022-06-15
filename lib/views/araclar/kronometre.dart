import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class KronometrePage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => KronometrePage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<KronometrePage> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: _stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data!;
                      final displayTime =
                          StopWatchTimer.getDisplayTime(value, hours: _isHours);
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              displayTime,
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: _stopWatchTimer.minuteTime,
                    initialData: _stopWatchTimer.minuteTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      return Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              )),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 100,
                      child: StreamBuilder<List<StopWatchRecord>>(
                        stream: _stopWatchTimer.records,
                        initialData: _stopWatchTimer.records.value,
                        builder: (context, snap) {
                          final value = snap.data!;
                          if (value.isEmpty) {
                            return SizedBox.shrink();
                          }
                          Future.delayed(const Duration(milliseconds: 100), () {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut);
                          });
                          return ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final data = value[index];
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '${index + 1} ${data.displayTime}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  )
                                ],
                              );
                            },
                            itemCount: value.length,
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: RaisedButton(
                          padding: EdgeInsets.all(4),
                          color: Colors.black,
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                          },
                          child: Text(
                            'BAŞLAT',
                            style: TextStyle(color: Colors.yellow.shade300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(4),
                          color: Colors.black,
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          },
                          child: Text(
                            'DUR',
                            style: TextStyle(color: Colors.yellow.shade300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: RaisedButton(
                          padding: EdgeInsets.all(4),
                          color: Colors.black,
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.reset);
                          },
                          child: Text(
                            'SIFIRLA',
                            style: TextStyle(color: Colors.yellow.shade300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
