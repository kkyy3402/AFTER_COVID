import React from "react";

function ButtonWrapper({text, fontFamily, onClick}){

    const style = {
        width: 236,
        height: 57,
        marginTop: 30,
        borderColor: "transparent",
        background: "#000000",
        color: "#ffffff",
        alignItems : "center",
        fontFamily : fontFamily
    }
    return(
        <div>
            <button style={style} onClick={onClick}>{text}</button>
        </div>
    )
}

export default ButtonWrapper;