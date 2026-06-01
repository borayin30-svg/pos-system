<?php include BASE_PATH . '/app/views/layouts/header.php'; ?>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0">Create New Customer</h5>
    </div>
    <div class="card-body">
        <form method="POST" action="<?php echo base_url('/customers/store'); ?>">
            <?php echo csrf_field(); ?>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Customer Name *</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <input type="tel" name="phone" class="form-control">
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" class="form-control">
                </div>
            </div>
            
            <div class="mb-3">
                <a href="<?php echo base_url('/customers'); ?>" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Create Customer
                </button>
            </div>
        </form>
    </div>
</div>

<?php include BASE_PATH . '/app/views/layouts/footer.php'; ?>
