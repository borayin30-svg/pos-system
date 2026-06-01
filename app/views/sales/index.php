<?php include BASE_PATH . '/app/views/layouts/header.php'; ?>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0">Sales History</h5>
    </div>
    <div class="card-body">
        <div class="alert alert-info">
            <i class="bi bi-info-circle"></i> Sales data will be displayed here.
        </div>
        <table class="table table-striped">
            <thead class="table-light">
                <tr>
                    <th>Receipt ID</th>
                    <th>Date</th>
                    <th>Customer</th>
                    <th>Amount</th>
                    <th>Payment Method</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="6" class="text-center text-muted"><?php echo lang('no_records'); ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<?php include BASE_PATH . '/app/views/layouts/footer.php'; ?>
