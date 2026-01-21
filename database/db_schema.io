Table Users {
  id uuid [PK]
  username varchar[30] [not null]
  first_name varchar[50]
  last_name varchar[50]
  phone_number varchar[12]
  email varchar[254] [not null]
  created_at timestamp [not null, default: `now()`]
}

Table Subscriptions {
  author_id uuid [ref: > Users.id]
  subscriber_id uuid [ref: > Users.id]
  created_at timestamp [not null, default: `now()`]

  indexes {
    (subscriber_id, author_id) [PK]
  }
}

Table Places {
  id uuid [PK]
  title varchar[50] [not null]
  description varchar[500]
}

Table Posts {
  id uuid [PK]
  author_id uuid [not null, ref: > Users.id]
  title varchar[30] [not null]
  description varchar[3000]
  place_id uuid [not null, ref: > Places.id]
  created_at timestamp [not null, default: `now()`]
}


Table PostImages {
  id uuid [PK]
  post_id uuid [not null, ref: > Posts.id]
  url varchar[255] [not null]
  size smallint
  mime_type varchar[8]
  created_at timestamp [not null, default: `now()`]
}

Table Comments {
  id uuid [PK]
  author_id uuid [not null, ref: > Users.id]
  post_id uuid [not null, ref: > Posts.id]
  message varchar[200] [not null]
  created_at timestamp [not null, default: `now()`]
}


Table Reactions {
  author_id uuid [ref: > Users.id]
  post_id uuid [ref: > Posts.id]
  is_like bool [not null, default: true, note: 'Лайк/дизлайк']
  created_at timestamp [not null, default: `now()`]

  indexes {
    (post_id, author_id) [PK]
  }
}
