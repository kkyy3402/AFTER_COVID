import React from "react";

function Image({src, width, height , padding}){

    const style={
        width : width,
        height : height,
        padding : padding
    }

    return(
        <div>
            <img style={style} src={src}></img>
        </div>
    )
}

export default Image;