import './index.css';
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Route, HashRouter } from "react-router-dom";
import { Provider } from "react-redux";
import { configurePersistor, configureStore } from './redux/store/store';
import App from './App';
import 'bootstrap/dist/css/bootstrap.min.css';
import Login from './components/Login';
// Redux setup
// const store = configureStore();
// const persistor = configurePersistor(store);
// const Wrapper = document.getElementById("root");


// class RouterNavigationSample extends React.Component {
//   render() {
//     return (
//       <Provider store={store}>
//         <Router>
//           <div className="container">
//             <>
//               <Route exact path="/" render={(props) => <Login {...props} />} />
//             </>
//           </div>
//         </Router>
//       </Provider>

//     );
//   }
// }

// const rootElement = document.getElementById("root");
// ReactDOM.render(<RouterNavigationSample />, rootElement);
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);