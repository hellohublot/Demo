import React, { Component } from 'react'
import { StatusBar } from 'react-native'
import { createAppContainer } from 'react-navigation'
import NavigationController from '~/common/navigation/NavigationController'

StatusBar.setBarStyle('light-content')

export default RootController = createAppContainer(NavigationController)

