import { NativeModules, Platform } from 'react-native';

const nativeComm = NativeModules.RNAppleLoginBridge;

export default () => {
	if (Platform.OS === 'android') {
		return reject({ type: 'platform', message: 'Not available for android platform' });
	}
	return nativeComm.startAppleLoginProcess();
	// return new Promise(function(resolve, reject) {
	// 	if (Platform.OS === 'android') {
	// 		reject({ type: 'platform', message: 'Not available for android platform' });
	// 	}
	// 	NativeModules.ReactNativeBridge.startAppleLoginProcess()
	// 		.then(resolve)
	// 		.catch(reject);
	// });
};
