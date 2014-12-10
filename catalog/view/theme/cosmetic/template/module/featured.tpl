<script>
$(function(){
    $('img.rollover').hover(function(){
        var e = $(this);
        e.data('originalSrc', e.attr('src'));
        e.attr('src', e.attr('data-rollover'));
    }, function(){
        var e = $(this);
        e.attr('src', e.data('originalSrc'));
    }); /* a preloader could easily go here too */
});
</script>
<h3><?php echo $heading_title; ?></h3>
<div class="row product-layout">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" itemscope itemtype="http://schema.org/Product">
    <div class="urunler product-thumb transition">
      <div class="image">
		    <?php if ($product['thumb_swap']) { ?>
			  <a href="<?php echo $product['href']; ?>" itemprop="url">
				<img class="rollover" src="<?php echo $product['thumb']; ?>" data-rollover="<?php echo $product['thumb_swap']; ?>" itemprop="image"/>
			  </a>
		    <?php } else {?>
			<a href="<?php echo $product['href']; ?>" itemprop="url">
				<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" itemprop="image"/>
			</a>
			<?php }?>
		</div>
      <div class="caption">
        <h4 itemprop="name"><a href="<?php echo $product['href']; ?>" itemprop="url"><?php echo $product['name']; ?></a></h4>
        <p itemprop="description"><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
          <?php if (!$product['special']) { ?>
         <span itemprop="price"><?php echo $product['price']; ?></span>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
