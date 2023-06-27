import sys

def main():
    if len(sys.argv) != 2:
        print("Usage: %s [ROM FILE]" % sys.argv[0])
        print("Recalculates the checksum for the provided Sega Genesis ROM, and inserts the result into the ROM header.")
        return 1
    else:
        with open(sys.argv[1], "rb") as f:
            rom = bytearray(f.read())
        if(len(rom) <= 0x200):
            print("%s is not a valid ROM" % sys.argv[1])
            return 1
        sum = 0
        for i in range(0x200, len(rom), 2):
            sum += rom[i] << 8
            sum += rom[i+1]
        print("Checksum: %04X" % (sum & 0xFFFF))
        rom[0x18E] = (sum >> 8) & 0xFF
        rom[0x18F] = sum & 0xFF
        with open(sys.argv[1], "wb") as f:
            f.write(rom)
  
if __name__ == '__main__':
  main()
