<?php include BASE_PATH . '/app/views/layouts/header.php'; ?>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0">Create New User</h5>
    </div>
    <div class="card-body">
        <form method="POST" action="<?php echo base_url('/users/store'); ?>">
            <?php echo csrf_field(); ?>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Username *</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email *</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Password *</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Role *</label>
                    <select name="role_id" class="form-control" required>
                        <option value="">-- Select Role --</option>
                        <?php if (!empty($roles)): ?>
                            <?php foreach ($roles as $role): ?>
                            <option value="<?php echo $role['id']; ?>">
                                <?php echo escape($role['name']); ?>
                            </option>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </select>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <input type="text" name="first_name" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="last_name" class="form-control">
                </div>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="tel" name="phone" class="form-control">
            </div>
            
            <div class="mb-3">
                <a href="<?php echo base_url('/users'); ?>" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Create User
                </button>
            </div>
        </form>
    </div>
</div>

<?php include BASE_PATH . '/app/views/layouts/footer.php'; ?>
