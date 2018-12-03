<?php if(count($errors)>0):?>    
    <div class="alert alert-danger" role="alert">
    	<?php foreach ($errors as $error):?>
    		<p class=text-center><?php echo $error; ?></p>
        <?php endforeach ?>
    </div>
<?php endif ?>