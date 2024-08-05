// SuperClase que nunca sera instanciada
abstract class Card{
    suit:string
    color:string
    number:string
}
// Subclases de Card
class Clover extends Card{
    static suit = "♣️"
    static color = "black"
}
class Heart extends Card{
    static suit = "♥️"
    static color = "red"
}
class Spade extends Card{
    static suit = "♠️"
    static color = "black"
}
class Diamond extends Card{
    static suit = "♦️"
    static color= "red"
}
class Magic extends Card {
    mana: number
    power: number
    thoughness: number
}
class Pokemon extends Card{
    hp: number
    attacks: Array<Object>
}
// Clase Base para Cartas Yu-Gi-Oh!
class YuGiOh extends Card{
    type: string
    description: string
}
// Subclases
class MonsterCard extends YuGiOh{
    static type = "monster"
    subType: [
        "normal", "effect", "fusion", "ritual", "synchro", "xyz", "pendulum", "link"
    ]
    attack: number
    defense: number
}
class MagicCard extends YuGiOh{
    static type = "magic"
    subType:string // ["normal", "quick", "continuous"]
}
class TrapCard extends YuGiOh{
    static type = "trap"
    subType: string // ["normal", "counter", "continous"]
}
