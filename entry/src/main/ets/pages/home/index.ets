import { AiApplicationBean,HomeGptRolesRecommend } from '../../data/bean/AiApplication'
import { GptRole } from '../../data/bean/GptRole';
import  {AiHomeStore} from "../../store/AiHomeStore"
import RouteManager from '../../views/RouteManager';

@Component
export struct HomeComponent {
  build() {
    Text('这是主页')
      .fontColor(Color.White)
  }

}
