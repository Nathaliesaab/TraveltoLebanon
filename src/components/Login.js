import React, { useState, useEffect } from 'react';
import { getAll } from '../api/api';
import {
    useHistory,
    Link
} from "react-router-dom";
import Travel from './Tarvel';


const Login = ({ id, setId }) => {

    let history = useHistory();

    const [data, setData] = useState([])
    const [values, setValues] = useState({
        Name: '',
        Password: '',

    });

    useEffect(() => {
        loadUsers()

    }, [])


    const loadUsers = async () => {

        const response = await getAll();
        try {
            setData(response?.data)

        } catch (error) {
            console.log(error);
        }
        finally {

        }
    }


    const changeHandlerAll = (Name) => event => {
        setValues({ ...values, [Name]: event.target.value })
        console.log(values);
    }

    function validateUser(event) {
        let Name = values.Name
        let Password = values.Password
        for (let i = 0; i < data.length; i++) {
            if (Name === data[i].Name && Password === data[i].Password) {
                return true;
            }
        }
    }

    function getID() {
        let name = values.Name
        let password = values.Password
        for (let i = 0; i < data.length; i++) {
            if (name === data[i].Name && password === data[i].Password) {
                return data[i].id;
            }
        }
    }

    function check() {
        if (validateUser()) {
            history.push('/travel');
            setId(getID())
        }
        else
            alert("Wrong username or password");
    }


    return (
        <div className="container-fluid text-center">
            <div style={{ height: '50px' }}></div>
            <h1>Login</h1>
            <div style={{ height: '50px' }}></div>

            <form className="text-center">
                <div className="row">
                    <div className="col">
                        <label htmlFor="username"><b>Username: &nbsp; </b> </label>
                        <input id="username" name="username" type="text" required onChange={changeHandlerAll('Name')} />
                    </div>
                </div>
                <div style={{ height: '50px' }}></div>
                <div className="row">
                    <div className="col">
                        <label htmlFor="pass"><b>Password: &nbsp; </b> </label>
                        <input id="pass" name="pass" type="password" required onChange={changeHandlerAll('Password')} />
                    </div>
                </div>
                <div style={{ height: '50px' }}></div>
                <div className="row">
                    <div className="col">
                        <Link style={{ marginLeft: "270px" }} type="submit" className="buttons" onClick={check} to={{
                            state: {
                                Name: values.Name,
                                id: getID(),
                            }
                        }} >Login</Link>
                        <div className="col loginFlight">
                            <Travel id={id} />
                        </div>
                    </div>
                </div>
                <div className="row">
                    <div className="col">
                        <div style={{ height: '25px' }}></div>
                        <div className="text-center">
                            <h5>  Don't have an acoount? Register here</h5>
                        </div>
                        <div style={{ height: '25px' }}></div>

                        <Link style={{ marginLeft: "270px" }} className="buttons" to='/register'>Register</Link>


                    </div>
                </div>


            </form >

        </div >

    );

}
export default Login;