<div class="modal modal-fluid fade" id="editBillingSetupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

            <form action="{{ isset($current_transaction_id) ? route('admin.update-billing'):'' }}" method="post" id="edit-billing-form">
                @csrf
                <input type="hidden" name="edit_connection_type" value="{{ $customer['connection_type'] ?? ''}}">
                <input type="hidden" name="edit_min_rates" value="{{  $rates['min_rate'] ?? '0'}}">
                <input type="hidden" name="edit_excess_rate" value="{{ $rates['excess_rates'] ?? '0'}}">
                <input type="hidden" name="edit_max_range" value="{{ $rates['max_range'] ?? '0'}}">
                <input type="hidden" name="edit_or_num" value="{{ $customer['balance'] != null ?? ($customer['balance']->payment_or_no ?? '') ?? ''}}">
                <input type="hidden" name="edit_surcharge" value="{{ $surcharge ?? '0'}}">
                <input type="hidden" name="edit_customer_id" value="{{ $customer['account'] ??'' }}">
                <input type="hidden" name="edit_curr_transaction_id" value="{{ $current_transaction_id ?? '' }}">
                <input type="hidden" name="edit_prev_transaction_id" value="">

                <div class="modal-header">
                    <h5 class="modal-title text-muted" id="exampleModalLabel"><i data-feather="file"></i><strong>&nbsp; Billing Updates Setup</strong></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <h6 class="text-danger">Note: Fields with (*) is required.</h6>
                    <h5 class="text-muted mt-4">Previous Meter Reading</h5>
                    <div class="row mt-3">
                        <div class="col-lg-4 col-md-6 mb-sm-2 pe-md-1 pe-sm-1">
                            <label class='text-muted'>Meter Reading</label>
                            <input class="form-control-plaintext ps-2" style="font-weight: bold; font-size: 20px;" id="edit_meter_reading_bal" name="edit_meter_reading_bal" type="number" placeholder="Meter reading" readonly min=0 value="">
                        </div>
                        <div class="col-lg-4 col-md-6 mb-sm-2 ps-md-0 pe-md-0 ps-sm-1">
                            <label class='text-muted'>Balance</label>
                            <input class="form-control-plaintext ps-2" style="font-weight: bold; font-size: 20px;" id="edit_cur_balance" name="edit_cur_balance" type="text" placeholder="Meter reading" min=0 readonly value="">
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-md-4 pe-md-0">
                            <label class='text-muted'>Reading Date</label>
                            <input type="text" style="font-weight: bold; font-size: 20px;" class="form-control-plaintext ps-2" name="edit_date" value="{{ isset($customer) ? ($customer['balance'] != null ? \Carbon\Carbon::parse($customer['balance']->reading_date)->format('F d, Y'):'') : '' }}" readonly>
                        </div>
                    </div>

                    <h5 class="text-muted mt-4">Updating Meter Reading</h5>
                    <div class="row mt-3">
                        <div class="col-md-4 pe-md-0">
                            <label class='text-muted'>Current Meter</label>
                            <input type="text" class="form-control-plaintext ps-2" name="current_meter" value="" readonly style="font-weight: bold; font-size: 20px;">
                        </div>
                        <div class="col-md-4 ps-md-1 pe-md-0">
                            <label class='text-muted'>Reading date (dd/mm/yyyy) <span class="text-danger"><strong>*</strong></span></label>
                            <input type="text" class="w-50 border-top-0 border-end-0 border-start-0 border-secondary rounded-0" id="edit_carbon_date_billing" value="{{ \Carbon\Carbon::now()->format('F d, Y') }}">
                            <input type="hidden" class="border-0 date" name="edit_reading_date" id="edit_reading_date" readonly>
                        </div>
                    </div>
                    <div class='row px-md-2 mb-2 mt-2'>
                        <div class='col-6 col-md-3 col-lg-2 col-xl-1 mt-2 pe-md-1 ps-md-1 ps-lg-1 pe-sm-1 pe-1'>
                            <small class='text-primary'>{{ isset($last_date) ? \Carbon\Carbon::parse($last_date)->format('M, Y') : '' }}</small>
                            <select name='edit_current_month' id='edit_current-month' class='form-select border-0' disabled style="font-weight: bold; font-size: 20px; color: #000">
                                @if(isset($customer))
                                @for($i = 1; $i <= \Carbon\Carbon::parse($last_date)->endOfMonth()->format('d'); $i++)
                                <option value="{{ \Carbon\Carbon::parse($last_date)->format('M '.($i < 10 ? '0'.$i : $i)) }}" {{ \Carbon\Carbon::parse($last_date)->format('d') == $i ? 'selected' : '' }}>{{ $i < 10 ? '0'.$i : $i }}</option>
                                @endfor
                                @endif
                            </select>

                        </div>
                        <div class='col-6 col-md-3 col-lg-2 col-xl-1 mt-2 ps-md-0 pe-md-0 ps-sm-0 ps-0'>
                            <small class='text-primary'>{{ isset($customer) ? \Carbon\Carbon::parse($last_date)->addMonths(1)->format('M, Y') : '' }}</small>
                            <select name='edit_next_month' id='edit_next-month' class='form-select border-0' disabled style="font-weight: bold; font-size: 20px; color: #000">
                                @if(isset($customer))
                                @for($i = 1; $i <=  \Carbon\Carbon::parse($last_date)->addMonths(1)->endOfMonth()->format('d'); $i++)
                                <option value="{{ \Carbon\Carbon::parse($last_date)->addMonths(1)->format('M '.($i < 10 ? '0'.$i : $i).', Y') }}" {{ \Carbon\Carbon::parse($last_date)->format('d') == $i ? 'selected' : '' }}>{{ $i < 10 ? '0'.$i : $i }}</option>
                                @endfor
                                @endif
                            </select>
                        </div>

                        <div class='col-6 col-md-6 col-lg-4 col-xl-2 mt-2 mt-lg-2 mt-md-2 px-lg-1 pe-sm-1 ps-md-1 pe-1'>
                            <small class='text-muted'>Meter Reading <span class="text-danger"><strong>*</strong></span></small>
                            <input class='form-control border-top-0 border-end-0 border-start-0 border-secondary rounded-0' type='number' min=0 id="edit_reading_meter" name="edit_reading_meter">
                        </div>

                        <div class='col-6 col-md-6 col-lg-4 col-xl-1 mt-2 mt-lg-2 mt-md-2 px-lg-0 ps-md-1 pe-md-0 ps-sm-0 ps-0'>
                            <small class='text-muted'>Consumption</small>
                            <input class='form-control-plaintext ps-3' style="font-weight: bold; font-size: 20px;" type='number' id="edit_consumption" name="edit_consumption" min=0 readOnly placeholder="0">
                        </div>
                        <div class='col-6 col-md-6 col-lg-4 col-xl-2 mt-2 mt-md-2 px-lg-1 pe-sm-1 ps-md-1 pe-1'>
                            <small class='text-muted'>Amount</small>
                            <input class='form-control-plaintext ps-3' style="font-weight: bold; font-size: 20px;" type='number' id="edit_amount" name="edit_amount" min=0 readOnly placeholder="0.00">
                        </div>
                        <div class='col-6 col-md-6 col-lg-4 col-xl-1 mt-2 mt-md-2 px-lg-0 ps-md-1 pe-md-0 ps-sm-0 ps-0'>
                            <small class='text-muted'>Surcharge</small>
                            <input class='form-control-plaintext ps-3' style="font-weight: bold; font-size: 20px;" type='number' name="edit_surcharge_amount" id="edit_surcharge_amount" value='0.00' min=0 readonly>
                        </div>
                        <div class='col-6 col-md-6 col-lg-4 col-xl-2 mt-2 mt-md-2 px-lg-1 pe-sm-1 ps-md-1 pe-1'>
                            <small class='text-muted'>Meter IPS Balance <span class="text-danger"><strong>*</strong></span></small>
                            <input class='form-control-plaintext ps-3' style="font-weight: bold; font-size: 20px;" type='number' name="edit_meter_ips" id="edit_meter-ips" readonly placeholder='0.00' min=0 value="{{ isset($customer) ? ($customer['balance'] != null ? \App\Classes\Facades\NumberHelper::toAccounting($customer['balance']->billing_meter_ips):'0.00') : '0.00' }}">
                        </div>
                        <div class='col-6 col-md-6 col-lg-4 col-xl-2 mt-2 mt-md-2 ps-lg-0 ps-md-1 pe-lg-1 ps-sm-0 pe-md-0 ps-0'>
                            <small class='text-muted'>Total</small>
                            <input class='form-control-plaintext ps-3' style="font-weight: bold; font-size: 20px;" type='number' id="edit_total" name="edit_total" placeholder='0.00' min=0 readonly>
                        </div>
                    </div>
                    <!-- <div class="row mt-3">
                        <div class="col-md-12 pe-md-0 d-flex justify-content-start align-items-center">
                            <input name="edit_override" id="edit_override" type="checkbox">
                            <label class='text-muted ms-2'>Allow override period covered date ?</label>
                        </div>
                    </div> -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i data-feather="x"></i> Close</button>
                    <button type="submit" class="btn btn-primary" id="update-billing" disabled><i data-feather="check"></i> Update</button>
                </div>
            </form>
        </div>
    </div>
</div>
