 <!-- Modal -->
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
     <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header modal-header-image mb-3">
                <h5 class="modal-title text-white">{{ @$data['title'] }} </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times text-white" aria-hidden="true"></i>
                </button>
            </div>
             <div class="modal-body">
                @if($data['type'] == 'check_in')
                <img  src="{{uploaded_asset(@$data['attendance_data']->check_in_image)}}" class="img-cover" >
                @else
                <img  src="{{uploaded_asset(@$data['attendance_data']->check_out_image)}}" class="img-cover" >
                @endif
                
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
             </div>
         </div>
     </div>
 </div>

