# PCP
# Ben Garness


# Function to come up with key
#
# Algorithm Outline:
# Characters in "meow":
# ["m", "e", "o", "w"]
# ASCII values of characters:
# [109, 101, 111, 119]
# ASCII values of each character multipled by 2:
# [218, 202, 222, 238]
# Sum of all values:
# 218 + 202 + 222 + 238 = 880
# Add one
# 880 + 1 = 881
#
# KEY IS 881

def GenerateKey(password)
  sum = 0
  password.split('').each do |char|
    item = char.ord
    sum += item*2
  end
  sum += 1
  sum
end

# Function to decrypt

def decrpytchar(char, key)
  return ((char.ord + key) % 128).chr
end

# Function to encrypt

def encryptchar(char, key)
  return ((char.ord - key) % 128).chr
end

# Function to load file

def loadFile(fileName)
  chararr = []
  File.open(".#{fileName}", "r") do |f|
    f.each_line do |line|
      tmparr = line.split('')
      tmparr.each do |t|
        chararr.push(t)
      end
    end
  end
  chararr
end

# Function to save text

def saveFile(fileName, chararr)
  File.open("./#{fileName}", "w") do |f|
    charr.each do |char|
      f.write(char)
    end
  end
end

raise 'Enter string for password, d or e for mode, and string for file name' unless ARGV.count >= 3
password, mode, file = ARGV[0].to_s, ARGV[1].to_s, ARGV[2].to_s

key = GenerateKey(password)

chararr = loadFile(file)
ansarr = []
chararr.each do |char|
  if mode == "d"
    ansarr.push(decrpytchar(char, key))
  elsif mode == "e"
    ansarr.push(encryptchar(char, key))
  end
end
ans = ansarr.join('')
puts ans