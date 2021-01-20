import './App.css';
import './style.css';
import TopView from "./Views/TopView";
import BottomView from "./Views/BottomView";
import React, {useState} from "react";
import { ModalProvider } from "react-modal-hook";
import ReactModal from "react-modal";
import { useModal } from "react-modal-hook";

function RegisterCardModal() {

    const [isOpen , setIsOpen] = useState(true);

    const registerPopupStyle = {
        overlay:{
            zIndex: 3,
            backgroundColor:'lightGrey'
        }
    }

    return (
        <div>

            <ReactModal
                isOpen={isOpen}
                style={registerPopupStyle}
            >
                <p>제목입니다.</p>
                <button onClick={onCloseBtnTapped}>Hide modal</button>
            </ReactModal>

        </div>

    );

    function onCloseBtnTapped() {
        setIsOpen(!isOpen)
    }

}

function App() {

    const [modalIsOpen, setModalIsOpen] = useState(false)

    return (
        <div className="App">
            <RegisterCardModal/>
            <TopView/>
            <BottomView/>
        </div>
    );
}

export default App;
