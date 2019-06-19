const hook = (component, appendPropsFunction) => {
	const componentRender = component.render
	component.render = function render(props) {
		let originProps = props
		let appendProps = appendPropsFunction(originProps)
		props = { ...appendProps, ...originProps, style: [appendProps.style, originProps.style] }
		try {
			return componentRender.apply(this, arguments)
		} finally {
			props = originProps
		}
	}
}

import { Text } from 'react-native'


hook(Text, (originProps) => {
	return {
		allowFontScaling: false,
		style: {

		}
	}
})