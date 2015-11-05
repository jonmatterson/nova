<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

if(isset($post)){
    if (( (int) $post->post_lock_user !== 0 and (int) $post->post_lock_date !== 0) 
            or ( (int) $post->post_lock_user == 0 and (int) $post->post_lock_date !== 0) 
            or ( (int) $post->post_lock_user !== 0 and (int) $post->post_lock_date == 0))
    {
        $this->posts->update_post_lock($post->post_id, 0, false);
    }
}

?>

<script type="text/javascript">
checkLock = function() {
    $('#readonly').hide();
    $('#editable').show();
};
</script>