import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ble_comm_protocol/dart/lib/bms_ble_protocol.dart';
import 'package:mobile_app/utils/extra.dart';
import 'package:mobile_app/widgets/connection_status.dart';

const String bmsServiceUuid = "91bad492-b950-4226-aa2b-4ede9fa42f59";
const String dataCharacUuid = "cba1d466-344c-4be3-ab3f-189f80dd7518";

class DashboardPage extends StatefulWidget {
  final BluetoothDevice device;

  const DashboardPage({Key? key, required this.device}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? _rssi;
  int? _mtuSize;
  BluetoothConnectionState _connectionState =
      BluetoothConnectionState.disconnected;
  List<BluetoothService> _services = [];
  bool _isDiscoveringServices = false;
  bool _isConnecting = false;
  bool _isDisconnecting = false;

  late StreamSubscription<BluetoothConnectionState>
      _connectionStateSubscription;
  late StreamSubscription<bool> _isConnectingSubscription;
  late StreamSubscription<bool> _isDisconnectingSubscription;
  late StreamSubscription<int> _mtuSubscription;

  StreamSubscription? _dataCharacLastValueStream;
  StreamSubscription? _dataCharacValueReceivedStream;
  StreamSubscription? _dataDescLastValueStream;
  StreamSubscription? _dataDescValueReceivedStream;

  // BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  // late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    // _adapterStateStateSubscription =
    //     FlutterBluePlus.adapterState.listen((state) {
    //   _adapterState = state;
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });
    _connectionStateSubscription =
        widget.device.connectionState.listen((state) async {
      _connectionState = state;
      if (state == BluetoothConnectionState.connected) {
        _services = []; // must rediscover services
      }
      if (state == BluetoothConnectionState.connected && _rssi == null) {
        _rssi = await widget.device.readRssi();
      }
      if (mounted) {
        setState(() {});
      }
    });

    _isConnectingSubscription = widget.device.isConnecting.listen((value) {
      _isConnecting = value;
      if (mounted) {
        setState(() {});
      }
    });

    _isDisconnectingSubscription =
        widget.device.isDisconnecting.listen((value) {
      _isDisconnecting = value;
      if (mounted) {
        setState(() {});
      }
    });

    discoverServices();
  }

  @override
  void dispose() {
    print('### dispose start');
    print('### $_dataCharacLastValueStream');
    if (_dataCharacLastValueStream != null) {
      print("### cancel");
      _dataCharacLastValueStream!.cancel();
    }
    if (_dataCharacValueReceivedStream != null) {
      _dataCharacValueReceivedStream!.cancel();
    }
    if (_dataDescLastValueStream != null) {
      _dataDescLastValueStream!.cancel();
    }
    if (_dataDescValueReceivedStream != null) {
      _dataDescValueReceivedStream!.cancel();
    }

    _connectionStateSubscription.cancel();
    _mtuSubscription.cancel();
    _isConnectingSubscription.cancel();
    _isDisconnectingSubscription.cancel();

    super.dispose();
  }

  bool get isConnected {
    return _connectionState == BluetoothConnectionState.connected;
  }

  Future discoverServices() async {
    // if (mounted) {
    //   setState(() {
    //     _isDiscoveringServices = true;
    //   });
    // }
    print("### Dscover");
    try {
      print("### connect");
      await widget.device.connectAndUpdateStream();
      print("### discvoner");
      _services = await widget.device.discoverServices();
      print("### dscv done");
      await findServices();
      print("### services find done");
      return true;
      // Snackbar.show(ABC.c, "Discover Services: Success", success: true);
    } catch (e) {
      print("### discover error");
      return false;
      // Snackbar.show(ABC.c, prettyException("Discover Services Error:", e),
      // success: false);
    }
    // if (mounted) {
    //   setState(() {
    //     _isDiscoveringServices = false;
    //   });
    // }
  }

  Future findServices() async {
    print("### service start $_services");

    _services.forEach((service) {
      print("### service ${service.uuid}");
      service.characteristics.forEach((charac) async {
        ///subscirbe
        if (charac.uuid.str != dataCharacUuid) {
          return;
        }

        print("### found match characetersit");

        await charac.setNotifyValue(true);

        print("### map stream");
        _dataCharacLastValueStream = charac.lastValueStream.listen((data) {
          print("### data ${data}");
        });
        _dataCharacValueReceivedStream =
            charac.onValueReceived.listen((value) async {
          final reads = await charac.read();
          print('### value notify $value');

          // print('### value reads $reads');

          DeviceInfo deviceInfo = getDeviceInfo(value);
          print('### device info $deviceInfo');

          ///iki digawe fubgsi dhewek
          // print("### value ${value}");
          // await charac.write("value".codeUnits);
        });

        charac.descriptors.forEach((desc) async {
          print("### sub desc $desc");
          _dataDescLastValueStream = desc.lastValueStream.listen((data) {
            print("### desc data $data");
          });
          _dataDescValueReceivedStream = desc.onValueReceived.listen((data) {
            print("### desc val rec $data");
          });
        });
      });
    });
  }

  getDeviceInfo(List<int> value) {
    BleMessageBuffer messageBuffer =
        BleMessageBuffer.fromUint8List(Uint8List.fromList(value));
    int offset = 0;
    final read = messageBuffer.readMessageHeader(0);

    MessageHeader? messageHeader = read.message;
    offset += read.bytesRead;

    print('### header $messageHeader');

    final readDeviceInfo = messageBuffer.readDeviceInfo(offset);

    DeviceInfo? deviceInfo = readDeviceInfo.message;
    offset += read.bytesRead;

    print('### $deviceInfo');
    return deviceInfo;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 241, 243, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ConnectionStatus(),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromRGBO(221, 221, 221, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Last charge was 13 hours ago',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(118, 133, 157, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '71',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color.fromRGBO(66, 122, 20, 1),
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '%',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color.fromRGBO(66, 122, 20, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your battery health is:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'good',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Temperature:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '32\u2103',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(89, 131, 208, 1),
                      ),
                    ),
                    child: Text(
                      'details',
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color.fromRGBO(82, 125, 205, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Voltage:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '72 V',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(89, 131, 208, 1),
                      ),
                    ),
                    child: Text(
                      'details',
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color.fromRGBO(82, 125, 205, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Current:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '5 A',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Location:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // const MiniMap()
            ],
          ),
        )
      ],
    );
  }
}
