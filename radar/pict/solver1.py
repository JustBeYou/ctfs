try:
    from PIL import Image
except ImportError:
    import Image
import pytesseract

print (pytesseract.image_to_string(Image.open("solved.jpg")))

output = ''
for i in range(1, 577):
    name = "%s.jpg" % i
    c = pytesseract.image_to_string(Image.open(name))
    print ("%s - %s" % (name, c))
    output += c
print (output)
