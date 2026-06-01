<?php include BASE_PATH . '/app/views/layouts/header.php'; ?>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0">Roles Management</h5>
    </div>
    <div class="card-body">
        <div class="alert alert-info">
            <i class="bi bi-info-circle"></i> Role management interface.
        </div>
        <table class="table table-striped">
            <thead class="table-light">
                <tr>
                    <th>Role Name</th>
                    <th>Slug</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($roles)): ?>
                    <?php foreach ($roles as $role): ?>
                    <tr>
                        <td><?php echo escape($role['name']); ?></td>
                        <td><code><?php echo escape($role['slug']); ?></code></td>
                        <td><?php echo escape($role['description']); ?></td>
                        <td>
                            <a href="<?php echo base_url('/roles/permissions/' . $role['id']); ?>" class="btn btn-sm btn-info">
                                <i class="bi bi-lock"></i> Permissions
                            </a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="4" class="text-center text-muted"><?php echo lang('no_records'); ?></td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?php include BASE_PATH . '/app/views/layouts/footer.php'; ?>
