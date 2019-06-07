/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { StyleSheet, Text, View, TouchableOpacity, NativeModules } from 'react-native';

//import LoginWithApple from './LoginWithApple';
import LoginWithApple from 'react-native-loginwithapple';

const nativ = NativeModules.ReactNativeBridge;

export default class App extends Component {
	render() {
		console.log(nativ);
		return (
			<View style={styles.container}>
				<Text style={styles.welcome}>Welcome to React Native!</Text>
				<TouchableOpacity
					onPress={() => {
						LoginWithApple()
							.then(res => {
								console.warn(res);
							})
							.catch(err => {
								console.warn(err);
							});
					}}
				>
					<Text>Login With Apple</Text>
				</TouchableOpacity>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: '#F5FCFF'
	},
	welcome: {
		fontSize: 20,
		textAlign: 'center',
		margin: 10
	},
	instructions: {
		textAlign: 'center',
		color: '#333333',
		marginBottom: 5
	}
});
