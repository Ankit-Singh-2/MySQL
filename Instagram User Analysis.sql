use ig_clone
describe users;
select *from users;

-- Find 5 oldest and latest users of Instagram from provided database

select *from users;
select username, created_at from users order by created_at limit 5;
select username, created_at from users order by created_at desc limit 5;

-- Find the users from database who have never posted a single photo on Instagram

select * from photos, users;
select u.username from users u left join photos p on p.user_id=u.id where p.image_url is null order by u.username;

-- Identify the winner of contest (more number of likes on photos) and provide their details to the team

select *from likes, photos, users;
select likes.photo_id, users.username, count(likes.user_id) as nooflikes from likes inner join photos on likes.photo_id=photos.id
inner join users on photos.user_id=users.id group by likes.photo_id, users.username order by nooflikes desc; 

-- Identify and suggest the top 5 most commonly used hashtags on the platform

select *from photo_tags,tags;
select t.tag_name, count(p.photo_id) as hashtags from photo_tags p inner join tags t on t.id=p.tag_id group by t.tag_name order by hashtags desc limit 5;

-- What day of the week do most users register on? Provide insights on  when to schedule an ad compaign

select * from users;
select date_format((created_at), '%W') as dayy, count(username) from users group by dayy order by 2 desc;

-- Provide how many times does the average user posts on instagram.

select * from photos,users;
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2) as average_post;

-- Provide data of users who have liked every single photo on the platform.

select * from users, likes,photos;
select users.id,username, count(users.id) as total_likes_by_user from users 
join likes on users.id=likes.user_id
group by users.id
having total_likes_by_user = (select count(*) from photos);

-- Find total numbers of users who have posted at least one time.

select * from users,photos;
select count(distinct(users.id)) as total_no_of_users from users
join photos on users.id=photos.user_id;

-- Find users ranking by posting from higher to lower.

select * from users, photos;
select users.username, count(photos.image_url) from users 
join photos on users.id=photos.user_id
group by users.id
order by 2 desc;




