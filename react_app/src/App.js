import './App.css';
import './style.css';
import TopView from "./Views/TopView";
import BottomView from "./Views/BottomView";
import Modal from "react-modal";
import React, {useState} from "react";

function App() {

    const [modalIsOpen, setModalIsOpen] = useState(false)

    return (
        <div className="App">

            <Modal
                isOpen={false}
                shouldCloseOverlayClick={false}
                style={
                    {
                        overlay:{
                            backgroundColor : 'grey'
                        }
                    }
                }
            >
                <div>
                    <h2>Mosdal title</h2>
                    <p>Modal Body</p>
                    <p>hi</p>
                </div>

            </Modal>

            <TopView/>
            <BottomView/>
        </div>
    );
}

export default App;
