import Foundation

print(start)
func charToInt(char:String) -> Int?{
    switch char{
    case "a":
        return 0
    case "b":
        return 1
    case "c":
        return 2
    case "d":
        return 3
    case "e":
        return 4
    case "f":
        return 5
    case "g":
        return 6
    case "h":
        return 7
    case "i":
        return 8
    case "j":
        return 9
    case "k":
        return 10
    case "l":
        return 11
    case "m":
        return 12
    case "n":
        return 13
    case "o":
        return 14
    case "p":
        return 15
    case "q":
        return 16
    case "r":
        return 17
    case "s":
        return 18
    case "t":
        return 19
    case "u":
        return 20
    case "v":
        return 21
    case "w":
        return 22
    case "x":
        return 23
    case "y":
        return 24
    case "z":
        return 25
    default:
        print("invalid letter")
        return nil
    }
}

func getInput() -> [String] {
    var inputString : [String] = []
    repeat {
        let inputWord = readLine() 
        if inputWord != "" {
            inputString.append(inputWord!)
        } else {
            print("no string given")
            print("executing sort")
            break
        }
    } while true
    return inputString
}

func priorChar(charA:String, charB:String)->String{
    if charToInt(char:charA)! <= charToInt(char:charB)! {
        return charA
    } else {
        return charB
    }
}

func postChar(charA:String, charB:String)->String{
    if charToInt(char:charA)! <= charToInt(char:charB)! {
        return charB
    } else {
        return charA
    }
}


func sortStrings(strings:[String]) -> [[String]] {
    let strings = strings
    var begCharStrings: [[String]] = []
    for word in strings {
        if begCharStrings == [[]] {
            begCharStrings.append([word])
        }
        var added = false
        for (count, array) in begCharStrings.enumerated() {
            //compare array's first word's first letter with word's first letter
            if array[0].prefix(1) == word.prefix(1) {
                begCharStrings[count].append(word)
                added = true
                break
            }
        }
        //if no array with first letter of word was found, make new array with word
        if !added {
            var position = 0
            for (count, array) in begCharStrings.enumerated() {
                if priorChar(charA:String(array[0].prefix(1)),charB:String(word.prefix(1))) == word.prefix(1) {
                    break
                } else {
                    position += 1
                }
            }
            begCharStrings.insert([word],at:position)    
        }
    }
    return begCharStrings
}

//from apple forums
func flatten(_ array: [Any]) -> [Any] {
    var result = [Any]()
    for element in array {
        if let element = element as? [Any] {
            result.append(contentsOf: flatten(element))
        } else {
            result.append(element)
        }
    }
    return result
}

let start = Foundation.clock()

let input = getInput()
print(input)
print(flatten(sortStrings(strings:input)))

//will print character preceding
print(priorChar(charA: "a",charB:"b"))
//will print character post (opposite of priorChar())
print(postChar(charA: "a",charB:"b"))

let diff = Foundation.clock() - start
print(diff)
