import glob
import os


for file in list(glob.glob("C:\\Users\\cuong\\Downloads\\ElectricGuitar\\*.mp3")):
    print(file)
    note = file.split("-")[len(file.split("-")) - 1].split(".")[0]
    print(note)
    #print(notesMap[note])
    os.rename(file, str((int(note) + 52)) + '.mp3')
