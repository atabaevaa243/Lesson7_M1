

import Foundation


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
var xpArray = [1000, 2000, 1000, 1500]
var damageArray = [200, 300, 0, 100]

var boss = "Boss"
var xpBoss = 5000
var damageBoss = 200


var count = 0
var heroIndex = 0
var hero = ""
var damageIndex = 0
var damageHero = 0
var xpIndex = 0
var xpHero = 0

while xpBoss > 0 && xpArray[0] > 0 || xpBoss > 0 && xpArray[1] > 0 || xpBoss > 0 && xpArray[2] > 0 || xpBoss > 0 && xpArray[3] > 0   {
    
    count += 1
    print("\nРаунд \(count) \n")
    
    print("Игроки атакуют!\n")
    
    
    for (index,array) in xpArray.enumerated() {
        xpIndex = index
        xpHero = array
        for (index,array) in charactersArray.enumerated(){
            heroIndex = index
            hero = array
            for (index,array) in damageArray.enumerated(){
                damageIndex = index
                damageHero = array
                if heroIndex == damageIndex && damageHero > 0 && xpBoss > 0 && xpIndex == heroIndex && xpHero > 0{
                    xpBoss = xpBoss - damageHero
                    print("\(hero) нанес \(damageHero) урона боссу. ХП босса - \(xpBoss)")
                }
                if xpBoss == 0 {
                    print ("Босс умер на \(count) раунде")
                    xpBoss = -1
                }
            }
        }
    }
    if xpBoss > 0 {
        print("\nБосс атакует!\n")
    }
    
    for (index,array) in xpArray.enumerated(){
        xpIndex = index
        xpHero = array
        for (index,array) in charactersArray.enumerated(){
            heroIndex = index
            hero = array
            if heroIndex == xpIndex && xpHero > 0 && xpBoss > 0 {
                xpHero = xpHero - damageBoss
                xpArray.remove(at: xpIndex)
                xpArray.insert(xpHero, at: xpIndex)
                print("Босс нанес \(damageBoss) урона герою \(hero). ХП героя \(hero) - \(xpHero)")
                if xpHero == 0 {
                    print("\(hero) УМЕР")
                    xpArray.remove(at: xpIndex)
                    xpArray.insert(-1, at: xpIndex)
                }
            }

        }
    }
    print(xpArray)
    
    if xpArray[2] > 0 {
        if count % 2 == 0 && count != 0   {
            xpArray[0] = xpArray[0] + 200
        }
    }
    if xpArray[2] > 0 {
        if count % 2 == 0 && count != 0 && xpArray[1] > 0  {
            xpArray[1] = xpArray[1] + 200
        }
    }
    if xpArray[2] > 0 {
        if count % 2 == 0 && count != 0 && xpArray[3] > 0  {
            xpArray[3] = xpArray[3] + 200
        }
    }
    
}

    if xpBoss > 0 {
        print("Босс победил, игроки мертвы")
    } else {
            print("Игроки победили, Босс мертв")
    }
    print("\nПрошло всего \(count) раундов")

    
