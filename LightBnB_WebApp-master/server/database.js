const properties = require('./json/properties.json');
const users = require('./json/users.json');

// connect to the lighthouse db
const { Pool } = require('pg');
const { query } = require('express');

const pool = new Pool({
  user: 'willfrankland',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

// pool.query(`SELECT title FROM properties LIMIT 10;`).then(response => { console.log(response) })
/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  const queryStringEmail = `SELECT *
  FROM users
  WHERE email = $1`
  // console.log('email: ', email)
  const values = [email]
  return pool
    .query(queryStringEmail, values)
    .then((result) => {
      // console.log('result: ', result)
      // console.log('rows: ', result.rows);
      return result.rows[0];
    })
    .catch((err) => {
      console.log(err.message);
    });
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  const queryStringID = `SELECT *
  FROM users
  WHERE id = $1`
  const values = [id]
  return pool
    .query(queryStringID, values)
    .then((result) => {
      // console.log('result: ', result)
      return result.rows[0];
    })
    .catch((err) => {
      console.log(err.message);
    });
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {
  const queryStringAddUser = `INSERT INTO users(name, email, password)
  VALUES($1, $2, $3)
  RETURNING *`
  const values = [user.name, user.email, user.password]
  return pool
    .query(queryStringAddUser, values)
    .then(() => {
      console.log(user.name + ' successfully added.')
    })
    .catch((err) => {
      console.log(err.message);
    });
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {
  const queryStringReservations = `SELECT *
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON property_reviews.property_id = properties.id
  JOIN users ON users.id = property_reviews.guest_id
  WHERE reservations.guest_id = $1
  GROUP BY reservations.id, properties.title, properties.cost_per_night
  ORDER BY start_date
  LIMIT 10;
  `
  const values = guest_id;
  return pool
    .query(queryStringReservations, [values])
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
}

exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit = 10) => {
  const queryParams = [];
  const base = 10;
  queryStringProperties = `SELECT *
  FROM properties
  JOIN property_reviews ON property_reviews.property_id = properties.id
  `;
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryStringProperties += `WHERE city LIKE $${queryParams.length} `;
  }

  if (options.owner_id) {
    queryParams.push(`%${options.owner_id}%`);
    queryStringProperties += `WHERE owner_id = $${queryParams.length} `;
  }

  if (options.minimum_price_per_night && options.maximum_price_per_night) {
    const min = (Number(options.minimum_price_per_night, base) * 100);
    const max = (Number(options.maximum_price_per_night, base) * 100);
    queryParams.push(min);
    queryStringProperties += `AND cost_per_night >= $${queryParams.length}`;
    queryParams.push(max);
    queryStringProperties += `AND cost_per_night <= $${queryParams.length}`;
  }

  queryStringProperties += `GROUP BY properties.id
    `;


  if (options.minimum_rating) {
    queryParams.push(options.minimum_rating);
    queryStringProperties += `HAVING AVG(property_reviews.rating) >= $${queryParams.length} 
      `;
  }

  queryParams.push(limit);
  queryStringProperties += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  console.log(queryStringProperties, queryParams);
  // const values = [options.city, options.minimum_cost, options.maximum_cost, options.minimum_rating]

  return pool.query(queryStringProperties, queryParams)
  .then((res) => res.rows)
  .catch(err => console.error(err));
};

exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
