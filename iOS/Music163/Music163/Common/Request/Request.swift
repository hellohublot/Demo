//
//  Request.swift
//  Music163
//
//  Created by hublot on 2018/12/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import JavaScriptCore
import CommonCrypto

class Request: NSObject {
	
	static func parseVideoIdString(_ videoIdString: String, _ complete: @escaping ((_: String) -> Void)) {
		let videoLinkString = "https://music.163.com/#/video?id=" + videoIdString
		let r = String.init(format: "%.10f", (Double(arc4random_uniform(255) + 1) / 257.0)).replacingOccurrences(of: "0.", with: "")
		let jsstring = """
		var generateStr = function(t) {
			var a = function() {
				for (var t = 0, e = new Array(256), n = 0; 256 != n; ++n)
					t = 1 & (t = 1 & (t = 1 & (t = 1 & (t = 1 & (t = 1 & (t = 1 & (t = 1 & (t = n) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1) ? -306674912 ^ t >>> 1 : t >>> 1, e[n] = t;
				return "undefined" != typeof Int32Array ? new Int32Array(e) : e;
			}();
			return function(t) {
				for (var e, n, i = -1, o = 0, r = t.length; o < r;)
					i = (e = t.charCodeAt(o++)) < 128 ? i >>> 8 ^ a[255 & (i ^ e)] : e < 2048 ? (i = i >>> 8 ^ a[255 & (i ^ (192 | e >> 6 & 31))]) >>> 8 ^ a[255 & (i ^ (128 | 63 & e))] : 55296 <= e && e < 57344 ? (e = 64 + (1023 & e), n = 1023 & t.charCodeAt(o++), (i = (i = (i = i >>> 8 ^ a[255 & (i ^ (240 | e >> 8 & 7))]) >>> 8 ^ a[255 & (i ^ (128 | e >> 2 & 63))]) >>> 8 ^ a[255 & (i ^ (128 | n >> 6 & 15 | (3 & e) << 4))]) >>> 8 ^ a[255 & (i ^ (128 | 63 & n))]) : (i = (i = i >>> 8 ^ a[255 & (i ^ (224 | e >> 12 & 15))]) >>> 8 ^ a[255 & (i ^ (128 | e >> 6 & 63))]) >>> 8 ^ a[255 & (i ^ (128 | 63 & e))];
				return -1 ^ i;
			}(t) >>> 0;
		};
		var result = generateStr('\(videoLinkString + "@" + r)');


		var site = 'yunyinyue';
		var sresult = result.toString();
		var willEncode = site.charAt(sresult.charCodeAt(0) % site.length) + sresult + site.charAt(sresult.charCodeAt(sresult.length - 1) % site.length);

		function h(t, e) {
		var n = (65535 & t) + (65535 & e);
		return (t >> 16) + (e >> 16) + (n >> 16) << 16 | 65535 & n
		}
		function s(t, e, n, i, o, r) {
		return h(function a(t, e) {
		return t << e | t >>> 32 - e
		} (h(h(e, t), h(i, r)), o), n)
		}
		function d(t, e, n, i, o, r, a) {
		return s(e & n | ~e & i, t, e, o, r, a)
		}
		function f(t, e, n, i, o, r, a) {
		return s(e & i | n & ~i, t, e, o, r, a)
		}
		function g(t, e, n, i, o, r, a) {
		return s(e ^ n ^ i, t, e, o, r, a)
		}
		function p(t, e, n, i, o, r, a) {
		return s(n ^ (e | ~i), t, e, o, r, a)
		}
		function u(t, e) {
		t[e >> 5] |= 128 << e % 32,
		t[14 + (e + 64 >>> 9 << 4)] = e;
		var n, i, o, r, a, s = 1732584193,
		u = -271733879,
		c = -1732584194,
		l = 271733878;
		for (n = 0; n < t.length; n += 16) u = p(u = p(u = p(u = p(u = g(u = g(u = g(u = g(u = f(u = f(u = f(u = f(u = d(u = d(u = d(u = d(o = u, c = d(r = c, l = d(a = l, s = d(i = s, u, c, l, t[n], 7, -680876936), u, c, t[n + 1], 12, -389564586), s, u, t[n + 2], 17, 606105819), l, s, t[n + 3], 22, -1044525330), c = d(c, l = d(l, s = d(s, u, c, l, t[n + 4], 7, -176418897), u, c, t[n + 5], 12, 1200080426), s, u, t[n + 6], 17, -1473231341), l, s, t[n + 7], 22, -45705983), c = d(c, l = d(l, s = d(s, u, c, l, t[n + 8], 7, 1770035416), u, c, t[n + 9], 12, -1958414417), s, u, t[n + 10], 17, -42063), l, s, t[n + 11], 22, -1990404162), c = d(c, l = d(l, s = d(s, u, c, l, t[n + 12], 7, 1804603682), u, c, t[n + 13], 12, -40341101), s, u, t[n + 14], 17, -1502002290), l, s, t[n + 15], 22, 1236535329), c = f(c, l = f(l, s = f(s, u, c, l, t[n + 1], 5, -165796510), u, c, t[n + 6], 9, -1069501632), s, u, t[n + 11], 14, 643717713), l, s, t[n], 20, -373897302), c = f(c, l = f(l, s = f(s, u, c, l, t[n + 5], 5, -701558691), u, c, t[n + 10], 9, 38016083), s, u, t[n + 15], 14, -660478335), l, s, t[n + 4], 20, -405537848), c = f(c, l = f(l, s = f(s, u, c, l, t[n + 9], 5, 568446438), u, c, t[n + 14], 9, -1019803690), s, u, t[n + 3], 14, -187363961), l, s, t[n + 8], 20, 1163531501), c = f(c, l = f(l, s = f(s, u, c, l, t[n + 13], 5, -1444681467), u, c, t[n + 2], 9, -51403784), s, u, t[n + 7], 14, 1735328473), l, s, t[n + 12], 20, -1926607734), c = g(c, l = g(l, s = g(s, u, c, l, t[n + 5], 4, -378558), u, c, t[n + 8], 11, -2022574463), s, u, t[n + 11], 16, 1839030562), l, s, t[n + 14], 23, -35309556), c = g(c, l = g(l, s = g(s, u, c, l, t[n + 1], 4, -1530992060), u, c, t[n + 4], 11, 1272893353), s, u, t[n + 7], 16, -155497632), l, s, t[n + 10], 23, -1094730640), c = g(c, l = g(l, s = g(s, u, c, l, t[n + 13], 4, 681279174), u, c, t[n], 11, -358537222), s, u, t[n + 3], 16, -722521979), l, s, t[n + 6], 23, 76029189), c = g(c, l = g(l, s = g(s, u, c, l, t[n + 9], 4, -640364487), u, c, t[n + 12], 11, -421815835), s, u, t[n + 15], 16, 530742520), l, s, t[n + 2], 23, -995338651), c = p(c, l = p(l, s = p(s, u, c, l, t[n], 6, -198630844), u, c, t[n + 7], 10, 1126891415), s, u, t[n + 14], 15, -1416354905), l, s, t[n + 5], 21, -57434055), c = p(c, l = p(l, s = p(s, u, c, l, t[n + 12], 6, 1700485571), u, c, t[n + 3], 10, -1894986606), s, u, t[n + 10], 15, -1051523), l, s, t[n + 1], 21, -2054922799), c = p(c, l = p(l, s = p(s, u, c, l, t[n + 8], 6, 1873313359), u, c, t[n + 15], 10, -30611744), s, u, t[n + 6], 15, -1560198380), l, s, t[n + 13], 21, 1309151649), c = p(c, l = p(l, s = p(s, u, c, l, t[n + 4], 6, -145523070), u, c, t[n + 11], 10, -1120210379), s, u, t[n + 2], 15, 718787259), l, s, t[n + 9], 21, -343485551),
		s = h(s, i),
		u = h(u, o),
		c = h(c, r),
		l = h(l, a);
		return [s, u, c, l]
		}
		function c(t) {
		var e, n = "",
		i = 32 * t.length;
		for (e = 0; e < i; e += 8) n += String.fromCharCode(t[e >> 5] >>> e % 32 & 255);
		return n
		}
		function l(t) {
		var e, n = [];
		for (n[(t.length >> 2) - 1] = void 0, e = 0; e < n.length; e += 1) n[e] = 0;
		var i = 8 * t.length;
		for (e = 0; e < i; e += 8) n[e >> 5] |= (255 & t.charCodeAt(e / 8)) << e % 32;
		return n
		}
		function r(t) {
		var e, n, i = "";
		for (n = 0; n < t.length; n += 1) e = t.charCodeAt(n),
		i += "0123456789abcdef".charAt(e >>> 2 & 15) + "0123456789abcdef".charAt(15 & e);
		return i
		}
		function n(t) {
		return unescape(encodeURIComponent(t))
		}
		function a(t) {
		return function e(t) {
		return c(u(l(t), 8 * t.length))
		} (n(t))
		}
		function m(t, e) {
		return function s(t, e) {
		var n, i, o = l(t),
		r = [],
		a = [];
		for (r[15] = a[15] = void 0, 16 < o.length && (o = u(o, 8 * t.length)), n = 0; n < 16; n += 1) r[n] = 909522486 ^ o[n],
		a[n] = 1549556828 ^ o[n];
		return i = u(r.concat(l(e)), 512 + 8 * e.length),
		c(u(a.concat(i), 640))
		} (n(t), n(e))
		}
		function e(t, e, n) {
		return e ? n ? m(e, t) : function i(t, e) {
		return r(m(t, e))
		} (e, t) : n ? a(t) : function o(t) {
		return r(a(t))
		} (t)
		}

		var didEncode = e(willEncode.toString())

		"""
		let jscontext = JSContext.init()
		jscontext?.evaluateScript(jsstring)
		let s = jscontext?.evaluateScript("result")?.toString() ?? ""
		
		let url = "http://service0.iiilab.com/video/web/yunyinyue"
		var request = URLRequest.init(url: URL.init(string: url) ?? URL.init(fileURLWithPath: url))
		request.httpMethod = "POST"
		request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15", forHTTPHeaderField: "User-Agent")
		request.setValue("http://yunyinyue.iiilab.com/", forHTTPHeaderField: "Referer")
		request.setValue("http://yunyinyue.iiilab.com", forHTTPHeaderField: "Origin")
		let didEncode = jscontext?.evaluateScript("didEncode")?.toString() ?? ""
		request.setValue(didEncode, forHTTPHeaderField: "X-Client-Data")
//		request.setValue("PHPSESSIID=673301545323; _ga=GA1.2.1052102473.1545320730; _gid=GA1.2.1938100324.1545320730; _gsp=GA71e52b9429d20e39; iii_Session=cginhqcrsr4csr2mbu6h1g3us3", forHTTPHeaderField: "Cookie")

		let bodyList = [
			"link=\(videoLinkString)",
			"r=\(r)",
			"s=\(s)"
		]
		let bodyString = bodyList.joined(separator: "&").addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
		let bodyData = bodyString.data(using: .utf8)
		request.httpBody = bodyData

		let firstCookieRequest = URLRequest.init(url: URL.init(string: "http://yunyinyue.iiilab.com") ?? URL.init(fileURLWithPath: ""))
		var secondCookieRequest = URLRequest.init(url: URL.init(string: "http://service0.iiilab.com/sponsor/getByPage") ?? URL.init(fileURLWithPath: ""))
		secondCookieRequest.httpMethod = "POST"
		secondCookieRequest.httpBody = "page=yunyinyue".data(using: .utf8)

		let session = URLSession.shared
		session.configuration.httpCookieAcceptPolicy = .always
		session.configuration.httpShouldSetCookies = true
		session.dataTask(with: firstCookieRequest) { (_, _, _) in
			session.dataTask(with: secondCookieRequest) { (_, _, _) in
				session.dataTask(with: request) { (data, response, error) in
					let jsonData = data ?? Data()
					let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any] ?? [String: Any]()
					let datalist = dictionary?["data"] as? [String: Any]
					complete((datalist?["video"] as? String) ?? "")
				}.resume()
			}.resume()
		}.resume()
	}

}
