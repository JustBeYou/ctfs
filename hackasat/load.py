import ccsdspy
from ccsdspy import PacketField

pkt = ccsdspy.FixedLength([
     PacketField(name='SHCOARSE', data_type='uint', bit_length=32),
     PacketField(name='SHFINE',   data_type='uint', bit_length=20),
     PacketField(name='OPMODE',   data_type='uint', bit_length=3),
     PacketField(name='SPACER',   data_type='fill', bit_length=1),
     PacketField(name='VOLTAGE',  data_type='int',  bit_length=8),
])


result = pkt.load('output.txt')
print (result)
