import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testeliteflower/src/core/utils/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  group("isConnected", () {
    test(
      "should forward the call to InternetConnectionChecker.hasConnection",
      () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);

        // act
        final result = await networkInfo.isConnected;

        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, true);
      },
    );
  });
}
