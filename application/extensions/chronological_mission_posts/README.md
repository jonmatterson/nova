## Requirements

This extension requires:

- Nova 2.6+
- Nova Extension `jquery`
- Nova Extension `timepicker`

## Installation

Copy the entire directory into `applications/extensions/chronological_mission_posts`.

Run the following command in your MySQL database:

```
ALTER TABLE nova_posts ADD COLUMN post_chronological_mission_post_day INTEGER NOT NULL DEFAULT 1;
ALTER TABLE nova_posts ADD COLUMN post_chronological_mission_post_time VARCHAR(4) NOT NULL DEFAULT '0000';
CREATE INDEX post_chronological_mission_post ON nova_posts (post_chronological_mission_post_day, post_chronological_mission_post_time);
```

Add the following to `application/config/extensions.php`:

```
$config['extensions']['enabled'][] = 'jquery';
$config['extensions']['enabled'][] = 'timepicker';
$config['extensions']['enabled'][] = 'chronological_mission_posts';
```
