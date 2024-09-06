import mysql from 'mysql2'

import dotenv from 'dotenv'
dotenv.config()

/* Creates a "pool" of connections to the db that can be reused 
   instead of creating a new one everytime. Good for scalability.
   Database setup provided by https://www.youtube.com/watch?v=Hej48pi_lOc */
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()


// USER RELATED QUERIES (endpoints in swift) -----------------------------------------------------------------
export async function getUser(username, password) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM Users
    WHERE username = ? AND password = ?
    `, [username, password]) // "Prepared statement".
    return rows[0]
}

export async function createUser(username, password, biography) {
    const [result] = await pool.query(`
    INSERT into Users (username, password, biography)
    VALUES (?, ?, ?)
    `, [username, password, biography])
    const id = result.insertId
    return getUser(id)
}

export async function getUsersViaUsername(username) {
    const [rows] = await pool.query("SELECT * FROM Users WHERE username LIKE '" + username + "%'")
    return rows
}

export async function addFollowing(username, following_username) {
    const [result] = await pool.query(`
    INSERT into Following (follower_username, followee_username)
    VALUES (?, ?)
    `, [username, following_username])
}

export async function deleteFollowing(username, following_username) {
    const [result] = await pool.query(`
    DELETE from Following 
    WHERE follower_username = ? AND followee_username = ?
    `, [username, following_username])
}

export async function getFollowing(username) {
    const [rows] = await pool.query("SELECT followee_username FROM Following WHERE follower_username = ?", username)
    return rows
}

export async function saveUserImage(user_id, data) {
    console.log(user_id)
    const [result] = await pool.query(`
    UPDATE Users
    SET userImage = ?
    WHERE user_id = ?
    `, [data, user_id])
}

// POST RELATED QUERIES (endpoints in swift) -----------------------------------------------------------------
export async function getWorkouts(username) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM Workouts
    WHERE username = ?
    `, username) // "Prepared statement".
    return rows
}

export async function getRecipes(username) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM Recipes
    WHERE username = ?
    `, username) // "Prepared statement".
    return rows
}

export async function createWorkout(title, timeReq, desc, username) {
    const [result] = await pool.query(`
    INSERT into Workouts (title, timeReq, description, username, created)
    VALUES (?, ?, ?, ?, TIMESTAMP(NOW()))
    `, [title, timeReq, desc, username])
    return result.insertId
    
}

export async function createRecipe(title, timeReq, desc, username, ingredients, directions) {
    const [result] = await pool.query(`
    INSERT into Recipes (title, timeReq, description, username, ingredients, directions, created)
    VALUES (?, ?, ?, ?, ?, ?, TIMESTAMP(NOW()))
    `, [title, timeReq, desc, username, ingredients, directions])
}

// MISC QUERIES (no endpoints in swift) -----------------------------------------------------------------
export async function getUsers() {
    const [rows] = await pool.query("SELECT * FROM Users") // Destructerizing assignment.
    return rows
}

export async function createExercise(exercise, workout_id) {
    const result = await pool.query(`
    INSERT into Exercises (title, sets, reps, notes, workout_id)
    VALUES (?, ?, ?, ?, ?)
    `, [exercise.exercise, exercise.sets, exercise.reps, exercise.notes, workout_id])
}