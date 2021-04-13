
<?php 
    $title = 'Edit Record';
    require_once 'includes/header.php';
    require_once 'db/conn.php';

    $result = $crud->getSpecialties();

    if(!isset($_GET['id']))
    {
        //echo 'error';
        include 'includes/errormessage.php';
        header ("Location: viewrecords.php");
    }else{
        $id = $_GET['id'];
        $attendee = $crud->getAttendeeDetails($id);
   
?>
    
    <h1 class="text-center">Edit Record</h1>
    
    <form method = "post" action= "editpost.php">  
    <input type="hidden" name="id" value = "<?php echo $attendee['attendee_id']?>" />
  <div class="mb-3">
    <label for="firstname" class="form-label">First Name</label>
    <input type="text" class="form-control" value ="<?php echo $attendee['firstname'] ?>" id="firstname" name="firstname">
  </div>
  <div class="mb-3">
    <label for="lasttname" class="form-label">Last Name</label>
    <input type="text" class="form-control" value ="<?php echo $attendee['lastname'] ?>" id="lastname"  name="lastname">
  </div>
  <div class="mb-3">
    <label for="dob" class="form-label">Date Of Birth</label>
    <input type="text" class="form-control" value ="<?php echo $attendee['dateofbirth'] ?>" id="dob" name="dob">
  </div>
  <div class="mb-3">
    <label for="specialty" class="form-label">Area of Expertise</label>
    <select class="form-control"value ="<?php echo $attendee['specialty_id'] ?>"  id="specialty" name="specialty">
        <?php while($r =$result->fetch(PDO::FETCH_ASSOC)){?>
            <option value="<?php echo $r['specialty_id'];?>"<?php if($r['specialty_id']==
            $attendee['specialty_id']) echo 'selected'?>>
                <?php echo $r['name'];?>
            </option> 

        <?php }?>
    </select>
  </div>
  <div class="mb-3">
    <label for="email" class="form-label">Email Address</label>
    <input type="text" class="form-control" value ="<?php echo $attendee['emailaddress'] ?>" id="email" name="email"
    aria-describedby ="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else. </small>
  </div>
  <div class="mb-3">
    <label for="phone" class="form-label">Contact Number</label>
    <input type="text" class="form-control" value ="<?php echo $attendee['contactnumber'] ?>"  id="phone" name="phone"
    aria-describedby ="phoneHelp" >
    <small id="phoneHelp" class="form-text text-muted">We'll never share your phone number with anyone else. </small>
  </div>
  
  <a href ="viewrecords.php"  class="btn btn-default">Back to List</a>
  <button type="submit" name="submit" class="btn btn-success">Save Change</button>
</form >

<?php } ?>
  <br>  
  <br> 
  <br> 
  <br> 
  <br> 
<?php require_once 'includes/footer.php';?>
   
