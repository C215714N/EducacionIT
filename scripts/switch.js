let idioma = prompt("Elegi un Idioma");
let message;
// Evaluacion por casos
switch(idioma.toLowerCase()){
    // Cuando la condicion utiliza como referencia un mismo dato o parametro podemos hacer una evalucion por casos
    case "ingles":
    case "inglés":
        message = "Britanico o Americano";
    break;
    case "frances":
    case "francés":
        message ="de Canada o Francia";
    break;
    case "portugues":
    case "portugués":
    case "portuges":
        message ="de Portugal o Brasil";
    break;
    case "español":
    case "espanol":
    case "espaniol":
        message ="de España o Latinoamerica";
    break;
    default:
        message ="de algun pais; pero Bueno, Lamento decir que no lo identifico";
}
document.write("El idioma que indicaste es " + idioma + " seguramente " + message);