## Requirements

This extension requires:

- Nova 2.6+
- Nova Extension `jquery`

## Installation

Copy the entire directory into `applications/extensions/bfms_character`.

Run the following command in your MySQL database:

```
ALTER TABLE nova_characters ADD COLUMN bfms_character_url TEXT;
```

Add the following to `application/config/extensions.php`:

```
$config['extensions']['enabled'][] = 'jquery';
$config['extensions']['enabled'][] = 'bfms_character';
```
