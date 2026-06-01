<?php include BASE_PATH . '/app/views/layouts/header.php'; ?>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0">Create New Product</h5>
    </div>
    <div class="card-body">
        <form method="POST" action="<?php echo base_url('/products/store'); ?>" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Product Name *</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">SKU *</label>
                    <input type="text" name="sku" class="form-control" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Cost Price</label>
                    <input type="number" step="0.01" name="cost_price" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Selling Price *</label>
                    <input type="number" step="0.01" name="selling_price" class="form-control" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Quantity in Stock</label>
                    <input type="number" name="quantity_in_stock" class="form-control" value="0">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Reorder Level</label>
                    <input type="number" name="reorder_level" class="form-control" value="10">
                </div>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control" rows="3"></textarea>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Product Image</label>
                <input type="file" name="image" class="form-control" accept="image/*">
            </div>
            
            <div class="mb-3">
                <a href="<?php echo base_url('/products'); ?>" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Create Product
                </button>
            </div>
        </form>
    </div>
</div>

<?php include BASE_PATH . '/app/views/layouts/footer.php'; ?>
