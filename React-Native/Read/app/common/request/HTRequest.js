let forge = require('node-forge')

export default HTRequest = (url, optionList = {}) => {
	optionList.credentials = 'include'
	optionList.headers = optionList.headers || {}
	optionList.headers['User-Agent'] = 'SingleRead/1.6.2 (iPhone; iOS 12.0; Scale/2.00)'
	optionList.headers['Accept-Language'] = 'zh-Hans-CN;q=1, en-CN;q=0.9'
	let requestType = optionList?.requestType
	let time = Math.round(new Date().getTime() / 1000)
	let deviceId = '2EDE5A2A-9EEA-463D-BF46-C472236FF270'
	let signDecode = `apiname=${requestType}device_id=${deviceId}time=${time}fk4iy@98(*Y98fh-^o)re+wg=`
	let md5 = forge.md.md5.create()
	md5.update(signDecode)
	let signEncode = md5.digest().toHex()

	let reurl = `${url}&sign=${signEncode}&device_id=${deviceId}&time=${time}&version=1.6.2&client=iOS`
	return fetch(reurl, optionList)
}