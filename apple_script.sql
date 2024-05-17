/*Columns Information
id (int): This column likely serves as a unique identifier for each record in the database.
track_name (text): This column stores the name or title of the app.
size_bytes (int): Stores the size of the app in bytes.
currency (text): Represents the currency used for the price of the app.
price (double): Stores the price of the app.
rating_count_tot (int): Total count of ratings received for the app.
rating_count_ver (int): Count of ratings received for the current version of the app.
user_rating (double): Represents the overall user rating of the app.
user_rating_ver (double): User rating for the current version of the app. 
ver (text): Indicates the version of the app.
cont_rating (int): Content rating of the app, likely in a numerical format.
prime_genre (text): Represents the primary genre/category of the app.
sup_devices.num (int): Number of supported devices for the app.
ipadSc_urls.num (int): Number of screenshots displayed for the app on iPad.
lang.num (int): Number of supported languages for the app.
vpp_lic (int): VPP (Volume Purchase Program) license indicator.*/

USE apple;

/* QUESTION 1: Which are the different genres? */

SELECT DISTINCT prime_genre
FROM applestore2;

/* QUESTION 2: Which is the genre with more apps rated? */

SELECT prime_genre,SUM(rating_count_tot) AS SUM
FROM applestore2
GROUP BY prime_genre
ORDER BY SUM DESC
LIMIT 1;

/* QUESTION 3: Which is the genre with more apps? */
SELECT prime_genre, COUNT(track_name) AS COUNT
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT DESC
LIMIT 1;

/* QUESTION 4: Which is the genre with more apps? */
SELECT prime_genre, COUNT(track_name) AS COUNT
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT ASC
LIMIT 1;

/* QUESTION 5:  Take the 10 apps most rated. */

SELECT track_name, SUM(rating_count_tot) as sum_rating
FROM applestore2
GROUP BY track_name
ORDER BY sum_rating DESC
LIMIT 10;

SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6:  Take the 10 apps best rated by users. */
SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7:  Take a look on the data you retrieved in the question 5. Give some insights. */
/* Overall, the high rating counts across these diverse categories indicate a broad range of user interests and app interactions on the App Store.

Social Media Dominance: 
Social media apps like Facebook and Instagram lead the list, highlighting the extensive engagement and large user bases these platforms have.

Gaming Popularity: 
Several games (Clash of Clans, Temple Run, Candy Crush Saga, Angry Birds) are among the most-rated apps, indicating that mobile gaming is a major driver of app interactions and ratings.

Streaming Services: 
Music streaming apps like Pandora and Spotify have also garnered high ratings, reflecting the growing trend of on-demand music consumption.
Diverse Use Cases: 
The presence of the Bible app shows that there is also significant engagement with non-entertainment and non-social media applications, catering to specific user needs such as religious content.*/


/* QUESTION 8:  Take a look on the data you retrieved in the question 6. Give some insights. */
/* The data reveals the ten best-rated apps by users on the App Store, each with a perfect user rating of 5. 


/* QUESTION 9:  TNow compare the data from questions 5 and 6. What do you see? */
/* The comparison reveals that while the most-rated apps reflect widespread use and engagement, the best-rated apps highlight niche satisfaction and quality experiences. 
Popular apps with extensive user bases receive diverse feedback, whereas niche apps can achieve perfect ratings by meeting specific user needs exceptionally well. 
This distinction underscores the different dimensions of app success: widespread appeal versus targeted excellence. */

/* QUESTION 10:  How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* Question 11: Does people care about the price? */
/* App Price Distribution: The majority of apps are free (0 price) with 4,049 apps. The count of apps decreases significantly as the price increases, with very few apps priced above $9.99. */
SELECT price, COUNT(*) AS count
FROM applestore2
GROUP BY price
ORDER BY price ASC;

/* Average User Rating by Price: As the price of apps increases, the average user rating generally tends to increase as well, up to a certain point.
This suggests that users who pay more for an app tend to rate it higher, possibly due to higher expectations of quality and value.*/
SELECT price, AVG(user_rating) AS avg_rating
FROM applestore2
GROUP BY price
ORDER BY price ASC;

/* Total Rating Count by Price: Free apps have the highest total rating count by a large margin, with nearly 80 million ratings. 
This indicates that free apps are far more accessible and reach a broader audience, resulting in significantly higher user engagement. */
SELECT price, SUM(rating_count_tot) AS total_ratings
FROM applestore2
GROUP BY price
ORDER BY price ASC;

/* Conclusion
I don't know if we can draw any conclusions from this because as the price increases, the user rating increases, but there aren't as many concerned users voting when the price is higher. 
Perhaps because they're more satisfied, they don't feel the need to go and vote. Or maybe it's because free applications often show pop ups for rating. */






