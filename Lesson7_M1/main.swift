

import Foundation

//Словари. Ключи повторяться не могут, индексов нет, только ключи. Отображаются в разброс, не по порядку

//var dictionary: [String: Int] = ["A": 1, "B": 2, "C": 3]
//
//print(dictionary)
//
//for (key,value) in dictionary{
//    print(key,value)
//}
//
//dictionary["D"] = 4 //Добавление
//dictionary["A"] = 10 //Меняет значение существующего ключа
//dictionary.removeValue(forKey: "B") //Удаляет из словаря
//
//print(dictionary)


//Опциональность

//let readline = readLine() ?? ""
//
//var arrayInt = [Int]()
//
//if Int(readline) != nil{
//    arrayInt.append(Int(readline)!)
//}else{
//    print("это не число")
//}
//print(arrayInt)

//Int = 0 - пустая тарелка
//String = "" - пустая тарелка
//nil - даже тарелки нет(вообще ничего нет, ни слов, ни чисел)

//var number: Int?
//
//number = 5
//
//print(number ?? 0) // ?? - оператор подмены

//var dictionary: [String: Int?] = ["A":10, "B":20, "C": nil]
//
//for (key,value) in dictionary{
//    if value != nil{
//        print(key,value!) //B 20
//                          //A 10
////        print(key,value) // A Optional(10)
//                           // B Optional(20)
//    }
//}


//Воин, Колдун, Медик, Защитник
//У каждого по 1000 ХП изначально (у защитника 1500)
//Каждый раунд наносят удар по 200, 300, 0, 100
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого
//Медик наносить удар не может

//Босс
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока не умрет
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем

//1 раунд
//Герои атакуют
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//Босс Атакует
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

//Игроки победили, БОСС мертв
//9 раундов прошло
//Если ХП - 0 (т.е герой умер - делаете принт (Герой) мертв)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//герой у которого 0 xp урон наносить не может !

var charactersArray = ["Воин", "Колдун", "Медик", "Защитник"]
var xpArray = [1000, 1000, 1000, 1500]
var damageArray = [200, 300, 0, 100]

var boss = "Boss"
var xpBoss = 5000
var damageBoss = 200

var count = 0
var countBoss = 0
var countVoin = 0
var countKoldun = 0
var countMedik = 0
var countZashitnik = 0

while xpBoss > 0 || xpArray [0] > 0 || xpArray [1] > 0 || xpArray [2] > 0 || xpArray [3] > 0 {
    
            if count % 2 == 0 && count != 0 && xpArray[0] > 0 {
                xpArray[0] = xpArray[0] + 200
            }
            if count % 2 == 0 && count != 0 && xpArray[1] > 0 {
                xpArray[1] = xpArray[1] + 200
            }
            if count % 2 == 0 && count != 0 && xpArray[3] > 0 {
                xpArray[3] = xpArray[3] + 200
            }
    
    
    if xpArray[0] > 0 && xpBoss > 0 {
        xpBoss = xpBoss - damageArray[0]
        xpArray[0] = xpArray[0] - damageBoss
        print("\(charactersArray[0]) нанес \(damageArray[0]) урона Боссу. У героя \(charactersArray[0]) осталось \(xpArray[0]) ХП")
        countVoin += 1
    }
    if xpArray[0] == 0 {
        print("ВОИН УМЕР НА \(countVoin) РАУНДЕ")
        xpArray[0] = -1
    }
    

    if xpArray[1] > 0 && xpBoss > 0 {
        xpBoss = xpBoss - damageArray[1]
        xpArray[1] = xpArray[1] - damageBoss
        print("\(charactersArray[1]) нанес \(damageArray[1]) урона Боссу. У героя \(charactersArray[1]) осталось \(xpArray[1]) XП")
        countKoldun += 1
    }
    if xpArray[1] == 0 {
        print("КОЛДУН УМЕР НА \(countKoldun) РАУНДЕ")
        xpArray[1] = -1
    }
    
            
    if xpArray[2] > 0 && xpBoss > 0 {
        xpArray[2] = xpArray[2] - damageBoss
        print("\(charactersArray[2]) не нанес урона Боссу. У героя \(charactersArray[2]) осталось \(xpArray[2]) XП")
        countMedik += 1
    }
    if xpArray[2] == 0 {
        print("МЕДИК УМЕР НА \(countMedik) РАУНДЕ")
        xpArray[2] = -1
    }

    
    if xpArray[3] > 0 && xpBoss > 0 {
        xpBoss = xpBoss - damageArray[3]
        xpArray[3] = xpArray[3] - damageBoss
        print("\(charactersArray[3]) нанес \(damageArray[3]) урона Боссу. У героя \(charactersArray[3]) осталось \(xpArray[3]) XП")
        countZashitnik += 1
    }
    if xpArray[3] == 0 {
        print("ЗАЩИТНИК УМЕР НА \(countZashitnik) РАУНДЕ")
        xpArray[3] = -1
    }
    
    
    if xpArray[0] == 0 && xpArray[1] == 0 && xpArray[2] == 0 && xpArray[3] == 0 {
        print("ЖИТЕЛИ УМЕРЛИ. БОСС ВЫИГРАЛ!")
        xpBoss = -1
        xpArray[0] = -1
        xpArray[1] = -1
        xpArray[2] = -1
        xpArray[3] = -1
    }
    
    
    if xpBoss > 0 {
        print ("У Босса осталось \(xpBoss) XП")
        countBoss += 1
    } else if xpBoss == 0 {
        print("БОСС УМЕР НА \(countBoss) РАУНДЕ. ГЕРОИ ВЫИГРАЛИ!")
        xpBoss = -1
        xpArray[0] = -1
        xpArray[1] = -1
        xpArray[2] = -1
        xpArray[3] = -1
    }
    
        count += 1

}

print("КОЛИЧЕСТВО РАУНДОВ \(count - 1)")

