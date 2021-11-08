import * as React from 'react';
import './App.css';
import { useState, useEffect, useRef } from 'react';
import {
    useLocation,
    useHistory,
} from "react-router-dom";
import { getTickets, insertFlight } from '../api/api';
import flight from '../images/Flight.png';
import Contact from './Contact';


const Flight = ({ id }) => {
    const [data, setData] = useState([]);
    let location = useLocation();
    let history = useHistory();

    useEffect(() => {
        loadTickets();
    }, [])


    const loadTickets = async () => {
        const response = await getTickets();
        try {
            setData(response?.data);
        } catch (error) {
            console.log(error);
        }
        finally {

        }
    }

    const purchaseFlight = (Ticket) => async (event) => {
        event.preventDefault();
        let Flight = {
            user_id: id,
            TicketNo: Ticket,
        }
        const info = await insertFlight(Flight);
        alert(info?.data.msg);
        history.push("/flight");
    }

    return (

        <div className="container-body text-center">
            <div className="row">
                <div className="col">
                    <img src={flight} alt="" class="img" />
                </div>
            </div>
            <div className="row" style={{ height: "40px" }}></div>
            <div className="container">
                <h1>Below are the available flights</h1>
                <div className="row" style={{ height: "40px" }}></div>
                <table className="table text-center" >
                    <thead>
                        <tr style={{ backgroundColor: "#282d32", color: "white" }}>
                            <th>Ticket Number</th>
                            <th>Time</th>
                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Price</th>
                            <th>Purchase</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            (data) ? data.map((item, index) => {
                                return (
                                    <tr key={index}>
                                        <td >{item.TicketNo}</td>
                                        <td>{item.Time}</td>
                                        <td >{item.Departure}</td>
                                        <td >{item.Destination}</td>
                                        <td style={{ color: "red", fontWeight: "900" }}>{item.Price}</td>
                                        <td><button className="btn btn-primary" onClick={purchaseFlight(item.TicketNo)}>Purchase</button></td>
                                    </tr>
                                )
                            }) : null
                        }
                    </tbody>
                </table >
            </div>
            <Contact />
        </div >


    );
}
export default Flight;