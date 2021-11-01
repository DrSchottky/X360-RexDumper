import sys
import struct


if(len(sys.argv) != 4):
    print("Usage: {} source_patchfile.bin dest_patchfile.bin payload.bin".format(sys.argv[0]))
    exit(1)

with open(sys.argv[1], "rb") as f:
    original_patchfile = f.read()

with open(sys.argv[3], "rb") as f:
    payload = f.read()


original_cb_size = 0x9390
new_cb_size = original_cb_size + len(payload)

new_patchfile = struct.pack(">L", original_cb_size) + struct.pack(">L", len(payload)//4) + payload + b"\x00\x00\x00\x0C\x00\x00\x00\x01" + struct.pack(">L", new_cb_size) + b"\x00\x00\x03\xE8\x00\x00\x00\x01\x48\x00\x8F\xA9" + original_patchfile

with open(sys.argv[2], "wb") as f:
    f.write(new_patchfile)
