from PIL import Image

# 画像の解像度（4K）
width, height = 3840, 2160

# 色 (RGB) - 例えば、黄色
color = (255, 255, 0)

# 黄色の画像の生成
image = Image.new("RGB", (width, height), color)

# 画像の保存
image.save("./docs/data/bgimage/yellow_background.jpeg")
