SELECT
    id ,
    create_at,
    deleted,
    status,
    update_at,
    user_id
FROM
    test
WHERE
    update_at >=date_add(:sql_last_value,interval 8 hour)