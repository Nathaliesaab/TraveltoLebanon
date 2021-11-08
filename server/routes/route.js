var express = require('express')
var router = express.Router()

var UsersController = require('../controller/UsersController')
var TicketsController = require('../controller/TicketsController')
var CountryController = require('../controller/CountryController')
var FlightsController = require('../controller/FlightsController')

/**
 * User Routes
*/
router.post('/updateUser', UsersController.updateUser)
router.post('/insertUser', UsersController.insertUser)
router.post('/deleteUser', UsersController.deleteUser)
router.get('/getAll', UsersController.getAll)



/**
 * Tickets Routes
 */

router.get('/getTickets', TicketsController.getTickets);
router.post('/updateTickets', TicketsController.updateTicket);
router.post('/deleteTickets', TicketsController.deleteTicket);


/**
 * Country Routes
 */

router.get('/getCountry', CountryController.getCountry);
router.post('/updateCountry', CountryController.updateCountry);
router.post('/deleteCountry', CountryController.deleteCountry);
router.post('/getCountrybyCategory', CountryController.getCountrybyCategory);

/**
 * FlighstRoutes
 */
router.post('/insertFlight', FlightsController.insertFlight);





module.exports = router