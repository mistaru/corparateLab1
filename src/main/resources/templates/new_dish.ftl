<#import "parts/common.ftl" as c>
<@c.page>

    <div>
        <form>
            <div class="form-outline mb-4">
                <input type="text"  name="nameDish" class="form-control" />
                <label class="form-label" for="form4Example1">Название</label>
            </div>

            <div class="form-outline mb-4">
                <input type="text" name="description" class="form-control" />
                <label class="form-label" for="form4Example2">Описание</label>
            </div>

            <div class="form-outline mb-4">
                <input type="number"  name="price" class="form-control" />
                <label class="form-label" for="form4Example3">Цена</label>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Send</button>
        </form>
    </div>

</@c.page>


