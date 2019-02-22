from PIL import Image


class ImageModel:
	name = '0'
	size = 0

	@classmethod
	def packModelArray(this):
		titlekey = "titlekey"
		sizekey = "sizekey"
		keyValueList = [
			{titlekey: "29", sizekey: 29},
			{titlekey: "40-ipad", sizekey: 40},
			{titlekey: "58-1", sizekey: 58},
			{titlekey: "58", sizekey: 58},
			{titlekey: "76-ipad", sizekey: 76},
			{titlekey: "80-ipad", sizekey: 80},
			{titlekey: "80", sizekey: 80},
			{titlekey: "87", sizekey: 87},
			{titlekey: "120-1", sizekey: 120},
			{titlekey: "120", sizekey: 120},
			{titlekey: "152-ipad", sizekey: 152},
			{titlekey: "167", sizekey: 167},
			{titlekey: "180", sizekey: 180},
			{titlekey: "1024", sizekey: 1024},
		]
		modelArray = []
		for keyValue in keyValueList:
			model = ImageModel()
			model.title = keyValue[titlekey]
			model.size = keyValue[sizekey]
			modelArray.append(model)
		return modelArray


def resizeImageModelArray(modelArray):
	image = Image.open('/Users/hublot/Desktop/logo.png')
	for model in modelArray:
		scale = model.size
		backgroundImage = Image.new('RGBA', (scale, scale), (0, 0, 0, 0))
		left = 0
		right = left
		width = float(scale - left - right)
		height = image.size[1] * (width / image.size[0])
		top = (scale - height) / 2
		bottom = top
		resizeImage = image.resize((int(width), int(height)), Image.ANTIALIAS)
		backgroundImage.paste(resizeImage, (int(left), int(top)))
		backgroundImage.save('/Users/hublot/Desktop/' + model.title + '.png', 'PNG')

if __name__ == '__main__':

	modelArray = ImageModel.packModelArray()
	resizeImageModelArray(modelArray)

