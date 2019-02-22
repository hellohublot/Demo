# coding=utf-8


import os
import requests
from urllib3 import encode_multipart_formdata


class Archive:


	def __init__(self, name, floder, identifier, profilesNameAdhoc, profilesNameAppStore, appStore):
		self.name = str(name)
		self.floder = str(floder)
		self.buildfloder = os.path.join(self.floder, 'ARBuild')
		self.identifier = identifier
		self.profilesNameAdhoc = profilesNameAdhoc
		self.profilesNameAppStore = profilesNameAppStore
		self.schemename = self.name
		self.appStore = appStore
		self.projectname = self.name + '.xcodeproj'
		self.workspacename = self.name + '.xcworkspace'

	def error(self, title):
		print('\033[1;37;41m')
		print (title + '\n') * 3
		print('\033[0m')

	def runcmd(self, cmd, step):
		os.chdir(self.floder)
		os.system(cmd)


	def start(self):
		os.chdir(self.floder)
		if os.path.isdir(self.floder) == False:
			self.error('工程文件夹不正确')
			return
		if os.path.exists(self.schemename) == False or os.path.exists(self.projectname) == False:
			self.error('找不到这个工程')
			return

		self.clear()
		archivePath = self.archive()
		ipaPath = self.export(archivePath)
		if self.appStore == False:
			self.upload(ipaPath)
		# else:
		# 	self.clear()

	

	def clear(self):
		cmd = 'rm -r ' + self.buildfloder
		self.runcmd(cmd, 'CLEAR')

	def join(self):
		if os.path.exists(self.workspacename):
			return '-workspace %s' % (self.workspacename)
		elif os.path.exists(self.projectname):
			return '-project %s' % (self.projectname)
		return ''

	def clean(self):
		cmd = 'xcodebuild %s -scheme %s -configuration Release clean' % (self.join(), self.schemename)
		self.runcmd(cmd, 'CLEAR')

	def build(self):
		cmd = 'xcodebuild %s -scheme %s -configuration Release' % (self.join(), self.schemename)
		self.runcmd(cmd, 'BUILD')

	def archive(self):
		archivePath = os.path.join(self.buildfloder, self.name + '.xcarchive')
		cmd = 'xcodebuild %s -scheme %s -configuration Release -archivePath %s archive' % (self.join(), self.schemename, archivePath)
		self.runcmd(cmd, 'ARCHIVE')
		return archivePath

	def export(self, archivePath):
		ipaFloder = self.buildfloder
		ipaPath = os.path.join(self.buildfloder, self.schemename + '.ipa')
		optionsPath = os.path.join(self.buildfloder, 'option.plist')
		optionsfile = open(optionsPath, 'wb')

		if self.appStore == True:
			method = 'app-store'
			optionsText = '''
				<?xml version="1.0" encoding="UTF-8"?>
				<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
				<plist version="1.0">
					<dict>
					<key>method</key>
					<string>%s</string>
					<key>signingStyle</key>
					<string>manual</string>
					<key>stripSwiftSymbols</key>
					<false/>
					<key>uploadSymbols</key>
					<true/>
					<key>provisioningProfiles</key>
					<dict>
						<key>%s</key>
						<string>%s</string>
					</dict>
					</dict>
				</plist>
			''' % (method, self.identifier, self.profilesNameAppStore)
		else:
			method = 'ad-hoc'
			optionsText = '''
				<?xml version="1.0" encoding="UTF-8"?>
				<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
				<plist version="1.0">
				<dict>
					<key>compileBitcode</key>
					<false/>
					<key>stripSwiftSymbols</key>
					<false/>
					<key>method</key>
					<string>%s</string>
					<key>provisioningProfiles</key>
					<dict>
						<key>%s</key>
						<string>%s</string>
					</dict>
				</dict>
				</plist>
			'''  % (method, self.identifier, self.profilesNameAdhoc)
		optionsfile.writelines(optionsText)
		optionsfile.flush()

		cmd = 'xcodebuild -exportArchive -archivePath %s -exportPath %s -exportOptionsPlist %s' % (archivePath, ipaFloder, optionsPath)
		self.runcmd(cmd, 'EXPORT')
		return ipaPath

	def upload(self, ipaPath):
		data = {'file': (os.path.basename(ipaPath), open(ipaPath, 'rb').read())}
		encode_data = encode_multipart_formdata(data)
		data = encode_data[0]
		header = {'Content-Type': encode_data[1]}
		response = requests.post('https://hublot.wang:8080/upload', headers = header, data = data)
		print('上传成功😁😄😆\n\n地址: https://hublot.wang:8080\n\n')





if __name__ == '__main__':
	
	projectname = 'MoneyBaide'



	name = 'MoneyDemo'
	floder = '/Users/hublot/Desktop/Work/%s/platforms/ios/' % (projectname)
	identifier = 'com.healthy.shop'
	profilesNameAdhoc = 'Shop-H'
	profilesNameAppStore = 'Shop-S'
	if projectname == 'Shop':
		name = 'Shop'
		floder = '/Users/hublot/Desktop/Work/Shop'
		identifier = 'com.healthy.shop'
		profilesNameAdhoc = 'Shop-H'
		profilesNameAppStore = 'Shop-S'
	elif projectname == 'Elm':
		name = 'VueCordovaDemo'
		floder = '/Users/hublot/Desktop/Test/vue-cordova-demo/platforms/ios'
		identifier = 'com.healthy.shop'
		profilesNameAdhoc = 'Shop-H'
		profilesNameAppStore = 'Shop-S'
	elif projectname == 'MoneyDemo':
		identifier = 'com.healthy.shop'
		profilesNameAdhoc = 'Shop-H'
		profilesNameAppStore = 'Shop-S'
	elif projectname == 'MoneyDream':
		identifier = 'com.healthy.dream'
		profilesNameAdhoc = 'Dream-H'
		profilesNameAppStore = 'Dream-S'
	elif projectname == 'MoneyEifchain':
		identifier = 'com.healthy.eif'
		profilesNameAdhoc = 'EIF-H'
		profilesNameAppStore = 'EIF-S'
	elif projectname == 'MoneyTDC':
		identifier = 'com.healthy.money'
		profilesNameAdhoc = 'Money-H'
		profilesNameAppStore = 'Money-S'
	elif projectname == 'MoneyWallet':
		identifier = 'com.healthy.wallet'
		profilesNameAdhoc = 'Wallet-H'
		profilesNameAppStore = 'Wallet-S'
	elif projectname == 'MoneyBaide':
		identifier = 'com.healthy.baide'
		profilesNameAdhoc = 'Baide-H'
		profilesNameAppStore = 'Baide-S'

	
	archive = Archive(name, floder, identifier, profilesNameAdhoc, profilesNameAppStore, False)
	archive.start()

