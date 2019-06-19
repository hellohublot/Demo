import { PropTypes } from 'prop-types'
global.PropTypes = PropTypes




import { Dimensions, Text, FlatList } from 'react-native'

const { width, height } = Dimensions.get('window')

global.SCREEN_WIDTH = width

global.SCREEN_HEIGHT = height

global.SCALE = (fix, compareFix, compareValue) => {
	return (fix * compareValue) / compareFix
}

global.SCALE_WIDTH = (value) => {
	return SCALE(value, 375.0, SCREEN_WIDTH)
}

global.SCALE_HEIGHT = (value) => {
	return SCALE(value, 667.0, SCREEN_HEIGHT)
}

global.CONTAINER = {
	flex: 1
}